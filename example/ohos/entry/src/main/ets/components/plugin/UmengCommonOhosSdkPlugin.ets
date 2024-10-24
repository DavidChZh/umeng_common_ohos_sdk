import {
  FlutterPlugin,
  FlutterPluginBinding,
  MethodCall,
  MethodCallHandler,
  MethodChannel,
  MethodResult,
  AbilityAware,
  AbilityPluginBinding
} from '@ohos/flutter_ohos';
import { common } from '@kit.AbilityKit';
import {init,onProfileSignIn,onProfileSignOff,preInit, InternalPlugin, setLogEnabled} from '@umeng/analytics';
import { hilog } from '@kit.PerformanceAnalysisKit';
/** UmengCommonOhosSdkPlugin **/
export default class UmengCommonOhosSdkPlugin implements FlutterPlugin, MethodCallHandler,AbilityAware {
  private context: common.UIAbilityContext | null = null;
  private channel: MethodChannel | null = null;


  onAttachedToAbility(binding: AbilityPluginBinding): void {
   this.context=binding.getAbility().context;
  }

  onDetachedFromAbility(): void {
    this.context=null;
  }

  getUniqueClassName(): string {
    return "UmengCommonOhosSdkPlugin"
  }

  onAttachedToEngine(binding: FlutterPluginBinding): void {
    this.channel = new MethodChannel(binding.getBinaryMessenger(), "umeng_common_ohos_sdk");
    this.channel.setMethodCallHandler(this)
  }

  onDetachedFromEngine(binding: FlutterPluginBinding): void {
    if (this.channel != null) {
      this.channel.setMethodCallHandler(null)
    }
  }

  onMethodCall(call: MethodCall, result: MethodResult): void {
    hilog.info(0x0000, 'testMethodCall', call.method);
    if (call.method == "getPlatformVersion") {
      result.success("OpenHarmony ^ ^ ")
    }else if(call.method == "preInit"){
      preInit({
        context: this.context!.getApplicationContext(),
        plugins: [new InternalPlugin()]
      });
    } else if(call.method == "init"){
      init();
    }else if(call.method == "onProfileSignIn"){
      const userID: string | null = call.args[0];
      onProfileSignIn("userID",userID);
    }else if(call.method == "onProfileSignOff"){
      onProfileSignOff();
    }else {
      result.notImplemented()
    }
  }
}