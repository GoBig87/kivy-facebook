#import "FBSDKCoreKit/FBSDKCoreKit.h"
#import "FBSDKLoginKit/FBSDKLoginKit.h"

typedef void (*callbackfunc) (const char *status, const char *error, void *util);

@interface FacebookLoginButton : NSObject
@end

void Login(callbackfunc callback, void *util);