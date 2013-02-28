//
//  ApptentivePlugin.m
//
//  Created by Jeff Pajor on 2/20/13.
//


#import "ApptentivePlugin.h"
#import "ATConnect.h"
#import "ATAppRatingFlow.h"

@implementation ApptentivePlugin

- (void) init:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    
    NSString *callbackId = [arguments pop];
    NSString *apptentiveAPIKey = [arguments objectAtIndex:0];
    CDVPluginResult *result;
    
    if ( apptentiveAPIKey != nil ) {
        connection = [ATConnect sharedConnection];
        connection.apiKey = apptentiveAPIKey;
    } else {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: @"apikey required"];
        [self writeJavascript:[result toErrorCallbackString:callbackId]];
    }
}

- (void) ratings:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    NSString *callbackId = [arguments pop];
    NSString *appId = [arguments objectAtIndex:0];
    NSString *force = [arguments objectAtIndex:1];
    
    CDVPluginResult *result;

    if ( appId != nil ) {
        ATAppRatingFlow *sharedFlow = [ATAppRatingFlow sharedRatingFlowWithAppID:appId];

        if( [force isEqualToString:@"yes"]) {
            [sharedFlow showEnjoymentDialog:self.webView.window.rootViewController];
        } else {
            [sharedFlow appDidLaunch:YES viewController:self.viewController];
        }

    } else {
        result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString: @"app id required"];
        [self writeJavascript:[result toErrorCallbackString:callbackId]];
    }
}

- (void) feedback:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options {
    NSString *callbackId = [arguments pop];
    CDVPluginResult *result;

    [connection presentFeedbackControllerFromViewController:self.viewController];
}

@end
