import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:umeng_common_ohos_sdk/umeng_common_ohos_sdk_method_channel.dart';

void main() {
  MethodChannelUmengCommonOhosSdk platform = MethodChannelUmengCommonOhosSdk();
  const MethodChannel channel = MethodChannel('umeng_common_ohos_sdk');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
