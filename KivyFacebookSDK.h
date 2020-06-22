#import <FBSDKCoreKit/Headers/FBSDKCoreKit.h>
#import <FBSDKLoginKit/Headers/FBSDKLoginKit.h>

typedef void (*callbackfunc) (const char *status, const char *error, void *callback);

@interface KivyFacebookSDK : NSObject

@property (nonatomic, assign) callbackfunc mCallback;
@property (nonatomic, assign) void* mUtil;


+(KivyFacebookSDK*) sharedInstance;
- (void) login:(callbackfunc)callback util:(void*)util;
@end

void Login(callbackfunc callback, void *util);
