# mobile_keyboard_visibility

获取键盘高度

## Getting Started
![demo](https://github.com/eyesoffish/mobile_keyboard_visibility/blob/main/demo.gif)
```yaml
dependencies:
  mobile_keyboard_visibility: ^0.0.6
```

```dart
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
      status = sender;
    });
  });
});
}

@override
void dispose() {
_mobileKeyboardVisibilityPlugin.dispose();
super.dispose();
}
```
This project is a starting point for a Flutter
[plug-in package](https://flutter.dev/developing-packages/),
a specialized package that includes platform-specific implementation code for
Android and/or iOS.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

