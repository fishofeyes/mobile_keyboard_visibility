import 'package:flutter/material.dart';
import 'package:mobile_keyboard_visibility/mobile_keyboard_visibility.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _mobileKeyboardVisibilityPlugin = MobileKeyboardVisibility();
  double height = 0;
  bool visibility = false;
  @override
  void initState() {
    super.initState();

    _mobileKeyboardVisibilityPlugin.mobileKeyBoardListener(onHeight: (sender) {
      setState(() {
        height = sender;
      });
    }, onShow: (sender) {
      setState(() {
        setState(() {
          visibility = sender;
        });
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              const TextField(),
              Text("键盘高度$height"),
              Text("键盘弹出$visibility"),
              TextButton(onPressed: () => _mobileKeyboardVisibilityPlugin.dispose(), child: Text("dispose"))
            ],
          ),
        ),
      ),
    );
  }
}
