import 'package:flutter/material.dart';
import 'package:g_captcha/g_captcha.dart';
import 'package:fluttertoast/fluttertoast.dart';

// TODO
const String CAPTCHA_SITE_KEY = "6LcKqfQUAAAAAC1I5Bjg0WI9RMc6wK9gjwG29Nr3";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(onPressed: _openReCaptcha, child: Text('reCaptcha')),
            ],
          )),
    );
  }

  _openReCaptcha() async {
    String tokenResult = await GCaptcha.reCaptcha(CAPTCHA_SITE_KEY);
    print('tokenResult: $tokenResult');
    Fluttertoast.showToast(msg: tokenResult, timeInSecForIosWeb: 4);

    // setState
  }
}
