#import "GCaptchaPlugin.h"
#if __has_include(<gCaptcha/gCaptcha-Swift.h>)
#import <gCaptcha/gCaptcha-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "gCaptcha-Swift.h"
#endif

@implementation GCaptchaPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftGCaptchaPlugin registerWithRegistrar:registrar];
}
@end
