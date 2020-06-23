#import "facebook_sdk.h"

@interface KivyFacebookSDK ()
@end

@implementation KivyFacebookSDK
{
}



-(void) LoginResult:(callbackfunc)callback util:(void*)util{

    FBSDKLoginManager *_loginManager = [[FBSDKLoginManager alloc] init];


    FBSDKLoginManagerLoginResultBlock handler = ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        FBSDKAccessToken *token = result.token;
        NSString *tokenString = token.tokenString;
        const char *tokenStringChar = [tokenString UTF8String];
        NSString *errorString = [error localizedDescription];
        const char *errorStringChar = [errorString UTF8String];
        callback(tokenStringChar, errorStringChar, util);
    };

    [_loginManager logInWithPermissions:@[@"public_profile"]
                     fromViewController:nil
                                handler:handler];

}
@end

void LoginCpp(callbackfunc callback, void *util){
    KivyFacebookSDK* kivyFacebookSDK = [[KivyFacebookSDK alloc] init];
    [kivyFacebookSDK LoginResult:callback util:util];
}