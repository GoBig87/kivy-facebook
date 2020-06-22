#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

typedef void (*callbackfunc) (const char *name, const char *error, void *util);

@interface KivyFacebookSDK : NSObject

@property (nonatomic, assign) callbackfunc mCallback;
@property (nonatomic, assign) void* mUtil;


+(KivyFacebookSDK*) sharedInstance;
- (void) login:(callbackfunc)callback util:(void*)util;
@end

void Login(callbackfunc callback, void *util);
