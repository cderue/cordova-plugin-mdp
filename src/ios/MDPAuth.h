#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>

@interface MVPAuth : CDVPlugin

- (void) authenticateWithState:(CDVInvokedUrlCommand*)command;

@end