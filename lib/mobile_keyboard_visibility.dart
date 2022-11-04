import 'mobile_keyboard_visibility_platform_interface.dart';

class MobileKeyboardVisibility {
  Future<void> mobileKeyBoardListener({Function(double height)? onHeight, Function(bool visibility)? onShow}) {
    return MobileKeyboardVisibilityPlatform.instance.mobileKeyBoardListener(onHeight: onHeight, onShow: onShow);
  }

  Future<void> dispose() {
    return MobileKeyboardVisibilityPlatform.instance.dispose();
  }
}
