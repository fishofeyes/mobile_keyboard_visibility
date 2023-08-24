import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('mobile_keyboard_visibility');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMethodCallHandler(null);
  });
}
