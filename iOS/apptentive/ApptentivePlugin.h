//
//  ApptentivePlugin.h
//  Bar Louie
//
//  Created by Jeff Pajor on 2/20/13.
//
//

#ifdef CORDOVA_FRAMEWORK
#import <Cordova/CDVPlugin.h>
#else
#import "Cordova/CDVPlugin.h"
#endif

#import "ATConnect.h"

@interface ApptentivePlugin : CDVPlugin {
    ATConnect *connection;
}

- (void) init:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void) ratings:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void) feedback:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;

@end
