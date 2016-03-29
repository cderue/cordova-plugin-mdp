#import <Cordova/CDV.h>
#import <UIKit/UIKit.h>

@interface MDPAuth : CDVPlugin

- (void) authenticateWithState:(CDVInvokedUrlCommand*)command;

- (void) test:(CDVInvokedUrlCommand*)command;

@end
