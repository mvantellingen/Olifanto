#import <Foundation/Foundation.h>

@interface OLConnectionOutlineController : NSObject <NSOutlineViewDelegate> {
    
    IBOutlet NSOutlineView * oview;
    
        
@private
    NSMutableArray *connections;


}

@property (nonatomic, assign) id delegate;

- (IBAction)click:(id)sender;

@end
