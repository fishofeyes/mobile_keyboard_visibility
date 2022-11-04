import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'mobile_keyboard_visibility_platform_interface.dart';

/// An implementation of [MobileKeyboardVisibilityPlatform] that uses method channels.
class MethodChannelMobileKeyboardVisibility extends MobileKeyboardVisibilityPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('mobile_keyboard_visibility');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
