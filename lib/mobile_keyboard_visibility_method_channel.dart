import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mobile_keyboard_visibility_platform_interface.dart';

/// An implementation of [MobileKeyboardVisibilityPlatform] that uses method channels.
class MethodChannelMobileKeyboardVisibility extends MobileKeyboardVisibilityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final eventChannel = const EventChannel('mobile_keyboard_visibility_listener');
  final methodChannel = const MethodChannel('mobile_keyboard_visibility_dispose');

  @override
  Future<void> mobileKeyBoardListener({Function(double height)? onHeight, Function(bool visibility)? onShow}) async {
    eventChannel.receiveBroadcastStream().listen(
      (event) {
        if (event["height"] is num) {
          if (onHeight != null) {
            onHeight(double.parse(event["height"]));
          }
        }
        if (event["visibility"] is bool) {
          if (onShow != null) {
            onShow(event["visibility"]);
          }
        }
      },
      onDone: () {
        if (kDebugMode) print("键盘监听移除");
      },
      onError: (e) {
        if (kDebugMode) print("键盘监听报错-----$e");
      },
    );
  }

  @override
  Future<void> dispose() async {
    await methodChannel.invokeListMethod("dispose");
  }
}
