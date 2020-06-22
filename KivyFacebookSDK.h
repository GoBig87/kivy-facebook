#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface KivyFacebookSDK : NSObject

@property (nonatomic, assign) callbackfunc mCallback;
@property (nonatomic, assign) void* mUtil;


+(KivyFacebookSDK*) sharedInstance;
- (void) Login;
@end

void Login();
