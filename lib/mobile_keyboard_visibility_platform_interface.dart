import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'mobile_keyboard_visibility_method_channel.dart';

abstract class MobileKeyboardVisibilityPlatform extends PlatformInterface {
  /// Constructs a MobileKeyboardVisibilityPlatform.
  MobileKeyboardVisibilityPlatform() : super(token: _token);

  static final Object _token = Object();

  static MobileKeyboardVisibilityPlatform _instance = MethodChannelMobileKeyboardVisibility();

  /// The default instance of [MobileKeyboardVisibilityPlatform] to use.
  ///
  /// Defaults to [MethodChannelMobileKeyboardVisibility].
  static MobileKeyboardVisibilityPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MobileKeyboardVisibilityPlatform] when
  /// they register themselves.
  static set instance(MobileKeyboardVisibilityPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<void> mobileKeyBoardListener({Function(num height)? onHeight, Function(KeyboardStatus status)? onShow}) {
    throw UnimplementedError('mobileKeyBoardListener() has not been implemented.');
  }

  Future<void> dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}

enum KeyboardStatus {
  willHide,
  didHide,
  willShow,
  didShow,
}
