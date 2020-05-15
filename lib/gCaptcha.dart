import 'dart:async';

import 'package:flutter/services.dart';

class GCaptcha {
  static const MethodChannel _channel =
      const MethodChannel('com.yuanchongyu.gcaptcha');

  static Future<String> reCaptcha(String siteKey) async {
    return await _channel.invokeMethod("reCaptcha", {"key": siteKey});
  }
}
