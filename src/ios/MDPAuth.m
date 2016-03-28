#import "MDPAuth.h"
#import <UIKit/UIKit.h>

@implementation MDPAuth

- (void)authenticateWithState:(CDVInvokedUrlCommand*)command
{

    NSString* callbackId = [command callbackId];
    NSString* clientId = [[command arguments] objectAtIndex:0];
    NSString* redirectUri = [[command arguments] objectAtIndex:1];
    NSString* state = [[command arguments] objectAtIndex:2];
    NSString* msg = [NSString stringWithFormat: @"Hello, %@", name];
   
    NSString* mydigipassUrlString = @"mydigipass-oauth://x-callback-url/2.0/authenticate?x-success=";

    mydigipassUrlString = [mydigipassUrlString stringByAppendingString:[self encodeString:redirectUri]];
    mydigipassUrlString = [mydigipassUrlString stringByAppendingString:@"&"];

    mydigipassUrlString = [mydigipassUrlString stringByAppendingString:@"client_id="];
    mydigipassUrlString = [mydigipassUrlString stringByAppendingString:[self encodeString:clientId]];
    mydigipassUrlString = [mydigipassUrlString stringByAppendingString:@"&"];

    mydigipassUrlString = [mydigipassUrlString stringByAppendingString:@"state="];
    mydigipassUrlString = [mydigipassUrlString stringByAppendingString:[self encodeString:state]];
     
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:mydigipassUrlString]];

    CDVPluginResult* result = [CDVPluginResult
                               resultWithStatus:CDVCommandStatus_OK
                               messageAsString:mydigipassUrlString];

    [self success:result callbackId:callbackId];
}

- (NSString *)encodeString:(NSString *)str
{
	return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(
                                                                                 NULL,
                                                                                 (CFStringRef)str,
                                                                                 NULL,
                                                                                 (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                 kCFStringEncodingUTF8 ));
}

@end