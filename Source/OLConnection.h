//
//  OLConnection.h
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLConnection : NSObject {
    
}

@property (assign) NSString *name;
@property (assign) NSString *hostname;
@property (assign) NSString *username;
@property (assign) NSString *password;

- (id) initWithDictionary:(NSDictionary *) data;
- (NSDictionary *) serialize;
@end
