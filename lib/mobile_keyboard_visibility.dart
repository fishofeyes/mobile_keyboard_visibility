import 'mobile_keyboard_visibility_platform_interface.dart';

class MobileKeyboardVisibility {
  Future<void> mobileKeyBoardListener({Function(num height)? onHeight, Function(KeyboardStatus status)? onShow}) {
    return MobileKeyboardVisibilityPlatform.instance.mobileKeyBoardListener(onHeight: onHeight, onShow: onShow);
  }

  Future<void> dispose() {
    return MobileKeyboardVisibilityPlatform.instance.dispose();
  }
}
