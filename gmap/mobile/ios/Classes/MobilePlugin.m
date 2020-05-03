#import "MobilePlugin.h"
#if __has_include(<mobile/mobile-Swift.h>)
#import <mobile/mobile-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mobile-Swift.h"
#endif

@implementation MobilePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMobilePlugin registerWithRegistrar:registrar];
}
@end
