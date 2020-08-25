import 'package:just_audio/just_audio.dart';
import 'package:music_app/generated/i18n.dart';

class FileToDuration {
 static Future<Duration> fileDuration(String url) async {
    final player = AudioPlayer();
    return await player.setUrl(url);
  }
}
