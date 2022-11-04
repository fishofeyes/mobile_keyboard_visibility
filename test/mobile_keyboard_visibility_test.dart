import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_keyboard_visibility/mobile_keyboard_visibility.dart';
import 'package:mobile_keyboard_visibility/mobile_keyboard_visibility_platform_interface.dart';
import 'package:mobile_keyboard_visibility/mobile_keyboard_visibility_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMobileKeyboardVisibilityPlatform with MockPlatformInterfaceMixin implements MobileKeyboardVisibilityPlatform {
  @override
  Future<void> mobileKeyBoardListener({Function(double height)? onHeight, Function(bool visibility)? onShow}) async {}

  @override
  Future<void> dispose() async {}
}

void main() {
  final MobileKeyboardVisibilityPlatform initialPlatform = MobileKeyboardVisibilityPlatform.instance;

  test('$MethodChannelMobileKeyboardVisibility is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMobileKeyboardVisibility>());
  });

  test('getPlatformVersion', () async {
    MobileKeyboardVisibility mobileKeyboardVisibilityPlugin = MobileKeyboardVisibility();
    MockMobileKeyboardVisibilityPlatform fakePlatform = MockMobileKeyboardVisibilityPlatform();
    MobileKeyboardVisibilityPlatform.instance = fakePlatform;
  });
}
