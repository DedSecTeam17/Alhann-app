import 'dart:math';

import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/custom_widgets/custom_card.dart';
import 'package:music_app/custom_widgets/loading_widget.dart';
import 'package:music_app/models/album_model.dart';
import 'package:music_app/utils/AppColors.dart';
import 'package:music_app/utils/hex_color.dart';
import 'package:music_app/utils/music_player_tools/audio_player_tasks.dart';
import 'package:music_app/utils/music_player_tools/audio_stream.dart';
import 'package:rxdart/rxdart.dart';
import 'package:provider/provider.dart';

void _audioPlayerTaskEntrypoint() async {
  AudioServiceBackground.run(() => AudioPlayerTask());
}

class Player extends StatefulWidget {
  String trackName;
  String artist;
  String albumImageUrl;
  String soundUrl;

  Player({this.trackName, this.artist, this.albumImageUrl, this.soundUrl});

  @override
  _PlayerState createState() => _PlayerState(
      trackName: trackName,
      artist: artist,
      albumImageUrl: albumImageUrl,
      soundUrl: soundUrl);
}

class _PlayerState extends State<Player> {
  String trackName;
  String artist;
  String albumImageUrl;
  String soundUrl;

  _PlayerState(
      {this.trackName, this.artist, this.albumImageUrl, this.soundUrl});

  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    prepareService();
  }

  prepareService() async {



    if (widget.trackName == null) {
      final player = AudioPlayer();
      var duration = await player.setUrl(widget.soundUrl);
      print("Duration ----->" + duration.inMilliseconds.toString());
      await AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
        androidNotificationChannelName: 'Audio Service Demo',
        // Enable this if you want the Android service to exit the foreground state on pause.
        //androidStopForegroundOnPause: true,
        androidNotificationColor: 0xFF2196f3,
        androidNotificationIcon: 'mipmap/ic_launcher',
        androidEnableQueue: true,
      );
      await AudioService.addQueueItems(context.read<AlbumModel>().queue);
    } else {
      final player = AudioPlayer();
      var duration = await player.setUrl(widget.soundUrl);
      print("Duration ----->" + duration.inMilliseconds.toString());


      await AudioService.start(
        backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
        androidNotificationChannelName: 'Audio Service Demo',
        // Enable this if you want the Android service to exit the foreground state on pause.
        //androidStopForegroundOnPause: true,
        androidNotificationColor: 0xFF2196f3,
        androidNotificationIcon: 'mipmap/ic_launcher',
        androidEnableQueue: true,
      );
      await AudioService.addQueueItems([
        MediaItem(
          id: widget.soundUrl,
          album: "",
          title: widget.trackName,
          artist: widget.artist,
          duration: duration,
          artUri: widget.albumImageUrl,
        )
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ScreenStateStream,
        builder: (ctx, snapshot) {
          final screenState = snapshot.data;
          final queue = screenState?.queue;
          final MediaItem mediaItem = screenState?.mediaItem;
          final state = screenState?.playbackState;
          final processingState =
              state?.processingState ?? AudioProcessingState.none;
          final playing = state?.playing ?? false;
//           if (processingState == AudioProcessingState.none  ) {
//           print("COMPLTED");
//          }
//
//           print("Status "+playing.toString() + processingState.toString());

          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: processingState != AudioProcessingState.none
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _trackImage(mediaItem.artUri),
                        _trackInfo(mediaItem.artist, mediaItem.title),
                        _trackOptions(),
//                _timeAndSeeker(),
                        positionIndicator(mediaItem, state),
                        _controls(playing)
                      ],
                    )
                  : Center(
                      child: LoadingWidget(
                        color: AppColors.mainColor,
                      ),
                    ));
        });
  }

  String _printDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return "$twoDigitMinutes:$twoDigitSeconds";
  }

  Widget positionIndicator(MediaItem mediaItem, PlaybackState state) {
    double seekPos;
    return StreamBuilder(
      stream: Rx.combineLatest2<double, double, double>(
          _dragPositionSubject.stream,
          Stream.periodic(Duration(milliseconds: 200)),
          (dragPosition, _) => dragPosition),
      builder: (context, snapshot) {
        double position =
            snapshot.data ?? state.currentPosition.inMilliseconds.toDouble();
        double duration = mediaItem?.duration?.inMilliseconds?.toDouble();
        return Padding(
          padding:
              const EdgeInsets.only(top: 28.0, bottom: 28, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _printDuration(state.currentPosition),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              duration != null
                  ? SizedBox(
                      width: 280,
                      child: Slider(
                        min: 0.0,
                        max: duration,
                        value: seekPos ?? max(0.0, min(position, duration)),
                        onChanged: (value) {
                          _dragPositionSubject.add(value);
                        },
                        onChangeEnd: (value) {
                          AudioService.seekTo(
                              Duration(milliseconds: value.toInt()));
                          // Due to a delay in platform channel communication, there is
                          // a brief moment after releasing the Slider thumb before the
                          // new position is broadcast from the platform side. This
                          // hack is to hold onto seekPos until the next state update
                          // comes through.
                          // TODO: Improve this code.
                          seekPos = value;
                          _dragPositionSubject.add(null);
                        },
                      ),
                    )
                  : SizedBox(),
              Text(
                _printDuration(Duration(milliseconds: duration.floor())),
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _trackImage(String albumImageUrl) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            boxShadow: [BoxShadow(color: HexColor("#e4e9ed"), blurRadius: 10)],
            image: DecorationImage(image: NetworkImage(albumImageUrl))),
      )
    ],
  );
}

Widget _trackInfo(String artist, String trackName) {
  return Padding(
    padding: const EdgeInsets.all(12.0),
    child: Column(
      children: <Widget>[
        Text(
          trackName,
          style: TextStyle(
              fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            artist,
            style: TextStyle(fontSize: 15, color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}

Widget _trackOptions() {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/options.png")),
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/download_item.png"))
          ],
        ),
        Row(
          children: <Widget>[
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/loading.png")),
            FlatButton(
                onPressed: () {},
                child: Image.asset("assets/images/louder.png"))
          ],
        )
      ],
    ),
  );
}

Widget _timeAndSeeker() {
  return Padding(
    padding: const EdgeInsets.only(top: 28.0, bottom: 28),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            "1:30",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        SizedBox(
            width: 270,
            height: 5,
            child: LinearProgressIndicator(
              value: 0.5,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.mainColor),
              backgroundColor: AppColors.greyWhite,
            )),
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: Text(
            "2:30",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ],
    ),
  );
}

Widget _controls(isPlaying) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: FlatButton(
            onPressed: () {
              AudioService.rewind();
            },
            child: Image.asset("assets/images/backword.png")),
      ),
      Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.mainColor.withOpacity(0.3), width: 1),
            borderRadius: BorderRadius.circular(70),
            color: AppColors.mainColor.withOpacity(0.2)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AppColors.mainColor,
                borderRadius: BorderRadius.circular(60)),
            child: Center(
              child: isPlaying
                  ? FlatButton(
                      onPressed: () {
                        AudioService.pause();
                      },
                      child: Image.asset("assets/images/puse.png"))
                  : FlatButton(
                      onPressed: () {
                        AudioService.play();
                      },
                      child: Image.asset("assets/images/big_play.png")),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8),
        child: FlatButton(
            onPressed: () {
              AudioService.fastForward();
            },
            child: Image.asset("assets/images/forward.png")),
      ),
    ],
  );
}
