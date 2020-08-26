#import "FBSDKCoreKit.framework/Headers/FBSDKCoreKit.h"
#import "FBSDKLoginKit.framework/Headers/FBSDKLoginKit.h"
#import "FBSDKLoginKit.framework/Headers/FBSDKLoginManager.h"
#import "FBSDKShareKit.framework/Headers/FBSDKShareKit.h"

typedef void (*typedefCB) (const char *status, const char *error, void *python_cb);

@interface FacebookController : NSObject

@property (nonatomic, assign) typedefCB mObjcCB;

+(FacebookController*) sharedInstance;
@end

void Login(typedefCB obcjCB, void *python_cb);
void GetGraphPath(typedefCB obcjCB, void *python_cb, char* field);
void SharePhoto(char* path);