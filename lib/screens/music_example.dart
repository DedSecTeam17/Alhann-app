import 'dart:math';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:audio_service/audio_service.dart';

//import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_app/utils/music_player_tools/audio_player_tasks.dart';
import 'package:music_app/utils/music_player_tools/audio_stream.dart';
import 'package:music_app/utils/music_player_tools/buttons_provider.dart';
import 'package:rxdart/rxdart.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Audio Service Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AudioServiceWidget(child: MainScreen()),
    );
  }
}

class MainScreen extends StatelessWidget {
  /// Tracks the position while the user drags the seek bar.
  final BehaviorSubject<double> _dragPositionSubject =
      BehaviorSubject.seeded(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Service Demo'),
      ),
      body: Center(
        child: StreamBuilder<ScreenState>(
          stream: ScreenStateStream,
          builder: (context, snapshot) {
            final screenState = snapshot.data;
            final queue = screenState?.queue;
            final mediaItem = screenState?.mediaItem;
            final state = screenState?.playbackState;
            final processingState =
                state?.processingState ?? AudioProcessingState.none;
            final playing = state?.playing ?? false;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                processingState == AudioProcessingState.none
                    ? Column(children: <Widget>[
                        audioPlayerButton(),
//                  setQueue()

//                  textToSpeechButton(),
                      ])
                    : Column(
                        children: <Widget>[
                          queue != null && queue.isNotEmpty
                              ? Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.skip_previous),
                                      iconSize: 64.0,
                                      onPressed: mediaItem == queue.first
                                          ? null
                                          : AudioService.skipToPrevious,
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.skip_next),
                                      iconSize: 64.0,
                                      onPressed: mediaItem == queue.last
                                          ? null
                                          : AudioService.skipToNext,
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          mediaItem?.title != null
                              ? Text(mediaItem.title)
                              : SizedBox(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              playing ? pauseButton() : playButton(),
                              stopButton(),
                            ],
                          ),
                          positionIndicator(mediaItem, state),
                          Text("Processing state: " +
                              "$processingState"
                                  .replaceAll(RegExp(r'^.*\.'), '')),
                          StreamBuilder(
                            stream: AudioService.customEventStream,
                            builder: (context, snapshot) {
                              return Text("custom event: ${snapshot.data}");
                            },
                          ),
                          StreamBuilder<bool>(
                            stream: AudioService.notificationClickEventStream,
                            builder: (context, snapshot) {
                              return Text(
                                'Notification Click Status: ${snapshot.data}',
                              );
                            },
                          ),
                        ],
                      )
              ],
            );
          },
        ),
      ),
    );
  }

  /// Encapsulate all the different data we're interested in into a single
  /// stream so we don't have to nest StreamBuilders.

//

  RaisedButton audioPlayerButton() => startButton(
        'AudioPlayer',
        () {
//          start the service with buttion
          AudioService.start(
            backgroundTaskEntrypoint: _audioPlayerTaskEntrypoint,
            androidNotificationChannelName: 'Audio Service Demo',
            // Enable this if you want the Android service to exit the foreground state on pause.
            //androidStopForegroundOnPause: true,
            androidNotificationColor: 0xFF2196f3,
            androidNotificationIcon: 'mipmap/ic_launcher',
            androidEnableQueue: true,
          );
        },
      );

  RaisedButton startButton(String label, VoidCallback onPressed) =>
      RaisedButton(
        child: Text(label),
        onPressed: onPressed,
      );

  IconButton playButton() => IconButton(
        icon: Icon(
          Icons.play_arrow,
          color: Colors.red,
        ),
        iconSize: 64.0,
        onPressed: AudioService.play,
      );

  IconButton pauseButton() => IconButton(
        icon: Icon(Icons.pause),
        iconSize: 64.0,
        onPressed: AudioService.pause,
      );

  IconButton stopButton() => IconButton(
        icon: Icon(Icons.stop),
        iconSize: 64.0,
        onPressed: AudioService.stop,
      );

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
        return Column(
          children: [
            duration != null
                ? Slider(
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
                  )
                : SizedBox(),
            Text("current duration : ${state.currentPosition}"),
          ],
        );
      },
    );
  }
}

// NOTE: Your entrypoint MUST be a top-level function.
void _audioPlayerTaskEntrypoint() async {
//  AudioServiceBackground.run(() => AudioPlayerTask([
//        MediaItem(
//          id: "https://boraqapp.nyc3.digitaloceanspaces.com/storage/track_media/i5yxitSiFAVNvMzXiuA5WXwly2X5v3DV3XHhXVzM.mp3",
//          album: "Science Friday",
//          title: "A Salute To Head-Scratching Science",
//          artist: "Science Friday and WNYC Studios",
//          duration: Duration(milliseconds: 5739820),
//          artUri: "https://api.adorable.io/avatars/285/abott@adorable.png",
//        ),
//        MediaItem(
//          id: "https://s3.amazonaws.com/scifri-segments/scifri201711241.mp3",
//          album: "Science Friday",
//          title: "From Cat Rheology To Operatic Incompetence",
//          artist: "Science Friday and WNYC Studios",
//          duration: Duration(milliseconds: 2856950),
//          artUri:
//              "https://media.wnyc.org/i/1400/1400/l/80/1/ScienceFriday_WNYCStudios_1400.jpg",
//        ),
//      ]));
}
