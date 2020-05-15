import 'dart:async';

import 'package:flutter/services.dart';

class GCaptcha {
  static const MethodChannel _channel =
      const MethodChannel('com.yuanchongyu.g_captcha');

  static Future<String> reCaptcha(String siteKey) async {
    return await _channel.invokeMethod("reCaptcha", {"key": siteKey});
  }
}
