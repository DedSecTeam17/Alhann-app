import 'package:logger/logger.dart';

class AppLogger {
  static var logger = Logger();

  static log({String message, MessageType type = MessageType.INFO}) {
    switch (type) {
      case MessageType.ERR:
        logger.e(message);
        break;
      case MessageType.INFO:
        logger.i(message);
        break;
      case MessageType.WARNING:
        logger.w(message);
        break;
      default:
        logger.d(message);
    }
  }
}

enum MessageType { ERR, INFO, WARNING }
