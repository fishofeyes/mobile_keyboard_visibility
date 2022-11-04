
import 'mobile_keyboard_visibility_platform_interface.dart';

class MobileKeyboardVisibility {
  Future<String?> getPlatformVersion() {
    return MobileKeyboardVisibilityPlatform.instance.getPlatformVersion();
  }
}
