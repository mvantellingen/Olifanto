#import <Foundation/Foundation.h>

@interface OLServerDataSource : NSObject <NSOutlineViewDataSource> {
    
@private

    IBOutlet NSOutlineView *view;
    NSMutableArray *list;
} @end
