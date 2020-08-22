#import "FBSDKCoreKit.framework/Headers/FBSDKCoreKit.h"
#import "FBSDKLoginKit.framework/Headers/FBSDKLoginKit.h"
#import "FBSDKLoginKit.framework/Headers/FBSDKLoginManager.h"

typedef void (*callbackfunc) (const char *status, const char *error, void *util);

@interface FacebookLoginButton : NSObject

@property (nonatomic, assign) callbackfunc mCallback;

@end

void Login(callbackfunc callback, void *util);