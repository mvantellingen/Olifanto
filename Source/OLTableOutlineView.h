#import <Foundation/Foundation.h>

@interface OLTableOutlineView : NSObject <NSOutlineViewDelegate> {
    
    IBOutlet NSOutlineView * oview;
    
    
@private
    NSMutableArray *tables;
    
}

@property (nonatomic, assign) id delegate;

- (IBAction)click:(id)sender;
@end
