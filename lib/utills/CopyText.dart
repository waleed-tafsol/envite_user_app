import 'package:flutter/services.dart';

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    print('Text copied to clipboard');
  });
}
