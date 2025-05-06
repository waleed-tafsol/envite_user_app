import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:flutter/services.dart';

void copyToClipboard(String text) {
  Clipboard.setData(ClipboardData(text: text)).then((_) {
    CustomSnackbar.showInfo("Copied", "code $text to ClipBoard");
  });
}
