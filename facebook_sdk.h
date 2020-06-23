#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

typedef void (*callbackfunc) (const char *status, const char *error, void *util);

@interface KivyFacebookSDK : NSObject



- (void) LoginResult:(callbackfunc)callback util:(void*)util;
@end

void Login(callbackfunc callback, void *util);
