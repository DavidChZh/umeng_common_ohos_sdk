import 'package:flutter_test/flutter_test.dart';
import 'package:umeng_common_ohos_sdk/umeng_common_ohos_sdk.dart';
import 'package:umeng_common_ohos_sdk/umeng_common_ohos_sdk_platform_interface.dart';
import 'package:umeng_common_ohos_sdk/umeng_common_ohos_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockUmengCommonOhosSdkPlatform
    with MockPlatformInterfaceMixin
    implements UmengCommonOhosSdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final UmengCommonOhosSdkPlatform initialPlatform = UmengCommonOhosSdkPlatform.instance;

  test('$MethodChannelUmengCommonOhosSdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelUmengCommonOhosSdk>());
  });

  test('getPlatformVersion', () async {
    UmengCommonOhosSdk umengCommonOhosSdkPlugin = UmengCommonOhosSdk();
    MockUmengCommonOhosSdkPlatform fakePlatform = MockUmengCommonOhosSdkPlatform();
    UmengCommonOhosSdkPlatform.instance = fakePlatform;

    expect(await umengCommonOhosSdkPlugin.getPlatformVersion(), '42');
  });
}
