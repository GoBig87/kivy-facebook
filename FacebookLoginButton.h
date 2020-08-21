#import <FBSDKLoginKit/FBSDKLoginManager.h>

typedef void (*callbackfunc) (const char *status, const char *error, void *util);

@interface FacebookLoginButton : NSObject


@property (nonatomic, assign) callbackfunc mCallback;
@property (nonatomic, assign) void* mUtil;

void PressFacebookButton(callbackfunc callback, void *util);