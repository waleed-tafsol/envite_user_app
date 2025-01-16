class ColoredPrint {
  static void red(String message) {
    _printWithColor(message, '\x1B[31m');
  }

  static void green(String message) {
    _printWithColor(message, '\x1B[32m');
  }

  static void yellow(String message) {
    _printWithColor(message, '\x1B[33m');
  }

  static void blue(String message) {
    _printWithColor(message, '\x1B[34m');
  }

  static void _printWithColor(String message, String colorCode) {
    print('$colorCode$message\x1B[0m');
  }
}
