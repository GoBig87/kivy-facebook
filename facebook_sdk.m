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

-(void) login:(callbackfunc)callback util:(void*)util{

    _callback = callback;
    _util = util;

    _loginManager = [[FBSDKLoginManager alloc] init];


    FBSDKLoginManagerLoginResultBlock handler = ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        FBSDKAccessToken *token = result.token;
        NSString *tokenString = token.tokenString;
        self.mCallback(*tokenString, *error, self.mUtil);
      };
    };

    [_loginManager logInWithPermissions:self.permissions
                                handler:handler];

}
@end


void Login(callbackfunc callback, void *util){
    KivyFacebookSDK* kivyFacebookSDK = [[KivyFacebookSDK alloc] init];
    [kivyFacebookSDK login:callback util:util];
}