import 'package:logger/logger.dart';

class L {
  static Logger logger = Logger();
  static void log(Level level, dynamic message) {
    logger.log(level, message);
  }
}
