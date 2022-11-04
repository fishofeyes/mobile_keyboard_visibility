import Flutter
import UIKit

public class SwiftMobileKeyboardVisibilityPlugin: NSObject, FlutterPlugin {
  
  let mobileHanlder = MobileKeyboardHandler()
  
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mobile_keyboard_visibility_dispose", binaryMessenger: registrar.messenger())
    let instance = SwiftMobileKeyboardVisibilityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
    
    let eventChannel = FlutterEventChannel(name: "mobile_keyboard_visibility_listener", binaryMessenger: registrar.messenger())
    eventChannel.setStreamHandler(instance.mobileHanlder)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if(call.method == "dispose") {
      
    }
  }
}
