import 'dart:async';

import 'package:flutter/services.dart';

class UmengCommonSdk {
  static const MethodChannel _channel =
      const MethodChannel('umeng_common_ohos_sdk');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static void preInit() async {
    _channel.invokeMethod('preInit');
  }

  static void init() async {
    _channel.invokeMethod('init');
  }

  static void onProfileSignIn(String userID) {
    List<dynamic> args = [userID];
    _channel.invokeMethod('onProfileSignIn', args);
  }

  static void onProfileSignOff() {
    _channel.invokeMethod('onProfileSignOff');
  }
}
