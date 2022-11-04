import Flutter
import UIKit

public class SwiftMobileKeyboardVisibilityPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "mobile_keyboard_visibility", binaryMessenger: registrar.messenger())
    let instance = SwiftMobileKeyboardVisibilityPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    result("iOS " + UIDevice.current.systemVersion)
  }
}
