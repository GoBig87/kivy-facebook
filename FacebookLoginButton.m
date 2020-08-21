#import "FacebookLoginButton.h"

@synthesize mCallback = _callback;
@synthesize mUtil = _util;

-(void)onPress:(callbackfunc)callback util:(void*)util{

    _callback = callback;
    _util = util;

   FBSDKLoginManager *login = [[FBSDKLoginManager alloc] init];
    if ([UIApplication.sharedApplication canOpenURL:[NSURL URLWithString:@"fb://"]])
    {
        login.loginBehavior = FBSDKLoginBehaviorSystemAccount;
    }

    [login logInWithReadPermissions:@[@"public_profile", @"email"] handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error)
        {
            NSLog(@"Unexpected login error: %@", error);
            NSString *callbackStr = error.localizedDescription;
            const char *callbackChar = [callbackStr UTF8String];
            self.mCallback(callbackChar, self.mUtil);
        }
        else
        {
            if(result.token)   // This means if There is current access token.
            {
                self.mCallback(callbackChar, self.mUtil);
            }
        }
    }];
}


void PressFacebookButton(callbackfunc callback, void *util){
    [onPress:callback util:util];
}