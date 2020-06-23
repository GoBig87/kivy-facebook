#import "facebook_sdk.h"


@interface KivyFacebookSDK ()

@end

@implementation KivyFacebookSDK
{
  FBSDKLoginManager *_loginManager;
  NSString *_userID;
  NSString *_userName;
}

@synthesize mCallback = _callback;
@synthesize mUtil = _util;

static KivyFacebookSDK *kivyFacebookSDK;

/* This creates a singleton Kivy Facebook object */
+ (KivyFacebookSDK*) sharedInstance
{
    if(kivyFacebookSDK == nil)
    {
        kivyFacebookSDK = [[kivyFacebookSDK alloc] init];
    }
    return kivyFacebookSDK;
}

-(void) login:(callbackfunc)callback util:(void*)util{

    _callback = callback;
    _util = util;

    _loginManager = [[FBSDKLoginManager alloc] init];


    FBSDKLoginManagerLoginResultBlock handler = ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        FBSDKAccessToken token = result.token;
        NSString *token = token.tokenString;
        self.mCallback(*token, *error, self.mUtil);
      }
    };

    [_loginManager logInWithPermissions:self.permissions
                     fromViewController:[FBSDKInternalUtility viewControllerForView:self]
                                handler:handler];

}


void Login(callbackfunc callback, void *util){
    [[KivyFacebookSDK sharedInstance] login:callback util:util];
}