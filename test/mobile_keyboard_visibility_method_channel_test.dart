import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_keyboard_visibility/mobile_keyboard_visibility_method_channel.dart';

void main() {
  MethodChannelMobileKeyboardVisibility platform = MethodChannelMobileKeyboardVisibility();
  const MethodChannel channel = MethodChannel('mobile_keyboard_visibility');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
