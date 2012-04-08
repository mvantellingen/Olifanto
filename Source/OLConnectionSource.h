//
//  OLConnectionSource.h
//  Olifanto
//
//  Created by Michael van Tellingen on 4/8/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OLConnectionSource : NSObject <NSOutlineViewDelegate> {
    
    IBOutlet NSOutlineView * oview;
    
        
@private
    NSMutableArray *connections;


}

@property (nonatomic, assign) id delegate;

- (IBAction)click:(id)sender;

@end
