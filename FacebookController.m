#import "FacebookController.h"

@interface FacebookController() <NSObject>
@end

@implementation FacebookController

@synthesize mObjcCB = _objcCB;

static FacebookController *facebookController;

+ (FacebookController*) sharedInstance
{
    if(facebookController == nil)
    {
        facebookController = [[FacebookController alloc] init];
    }
    return facebookController;
}

-(void) LoginResult:(typedefCB)objcCB python_obj:(void*)python_obj python_cb:(void*)python_cb{

    _objcCB = objcCB;

    FBSDKLoginManager *_loginManager = [[FBSDKLoginManager alloc] init];

    FBSDKLoginManagerLoginResultBlock handler = ^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        FBSDKAccessToken *token = result.token;
        NSString *tokenString = token.tokenString;
        const char *tokenStringChar = [tokenString UTF8String];
        NSString *errorString = [error localizedDescription];
        const char *errorStringChar = [errorString UTF8String];
        self.mObjcCB(tokenStringChar, errorStringChar, python_obj, python_cb);
    };

    [_loginManager logInWithPermissions:@[@"public_profile", @"email"]
                     fromViewController:nil
                                handler:handler];

}

-(void) GraphPathUser:(typedefCB)objcCB python_obj:(void*)python_obj python_cb:(void*)python_cb field:(char*)field{

    _objcCB = objcCB;

    NSString *fields = [NSString stringWithUTF8String:field];
    NSMutableDictionary* parameters = [NSMutableDictionary dictionary];
    [parameters setValue:fields forKey:@"fields"];

    if ([FBSDKAccessToken currentAccessToken]) {
       [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:parameters]
        startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
            NSString *errorString = [error localizedDescription];
            const char *errorStringChar = [errorString UTF8String];
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:result
                                                   options:0
                                                     error:&error];
            NSString *resultString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            const char *resultChar = [resultString UTF8String];
            self.mObjcCB(resultChar, errorStringChar, python_obj, python_cb);
      }];
    }
}

-(void) ShareUiImage:(char*)path{
    // Load UI Image
    NSString *imagePath = [NSString stringWithUTF8String:path];
    UIImage *image = [UIImage imageWithContentsOfFile:imagePath];

    // Create photo for Facebook
    FBSDKSharePhoto *photo = [[FBSDKSharePhoto alloc] init];
    photo.image = image;
    photo.userGenerated = YES;
    FBSDKSharePhotoContent *content = [[FBSDKSharePhotoContent alloc] init];
    content.photos = @[photo];

    // Create Share button
    FBSDKShareButton *button = [[FBSDKShareButton alloc] init];
    button.shareContent = content;
    button.hidden = YES;

    // Automate push button
    [button sendActionsForControlEvents:UIControlEventTouchUpInside];
}

@end

void Login(typedefCB obcjCB, void *python_obj, void *python_cb){
    [[FacebookController sharedInstance]  LoginResult:obcjCB python_obj:python_obj python_cb:python_cb];
}

void GetGraphPath(typedefCB obcjCB, void *python_obj, void *python_cb, char *field){
    [[FacebookController sharedInstance] GraphPathUser:obcjCB python_cb:python_cb field:field];
}

void SharePhoto(char* path){
    [[FacebookController sharedInstance] ShareUiImage:path];
}