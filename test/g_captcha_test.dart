import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:g_captcha/g_captcha.dart';

void main() {
  const MethodChannel channel = MethodChannel('com.yuanchongyu.g_captcha');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

}
