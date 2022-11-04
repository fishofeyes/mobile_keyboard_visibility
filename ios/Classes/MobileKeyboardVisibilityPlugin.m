#import "MobileKeyboardVisibilityPlugin.h"
#if __has_include(<mobile_keyboard_visibility/mobile_keyboard_visibility-Swift.h>)
#import <mobile_keyboard_visibility/mobile_keyboard_visibility-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mobile_keyboard_visibility-Swift.h"
#endif

@implementation MobileKeyboardVisibilityPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMobileKeyboardVisibilityPlugin registerWithRegistrar:registrar];
}
@end
