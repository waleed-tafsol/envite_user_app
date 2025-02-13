import 'package:share_plus/share_plus.dart';

class ShareService {
  static Future<void> shareMessage(String message, {String? subject}) async {
    await Share.share(message, subject: subject);
  }
}
