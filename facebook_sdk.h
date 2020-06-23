#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

typedef void (*callbackfunc) (const char *status, const char *error, void *util);

@interface KivyFacebookSDK : NSObject
@end
