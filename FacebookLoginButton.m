#import "FacebookLoginButton.h"

@interface FacebookLoginButton() <NSObject>
@end

@implementation FacebookLoginButton

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

void Login(callbackfunc callback, void *util){
    FacebookLoginButton* facebookLoginButton = [[FacebookLoginButton alloc] init];
    [facebookLoginButton LoginResult:callback util:util];
}