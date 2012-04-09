#import "OLMainController.h"
#import "OLConnectionController.h"
#import "OLDatabaseController.h"

@implementation OLMainController : NSViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}


- (void) showConnectionView
{
    NSLog(@"showConnectionView()");
    connController = [[OLConnectionController alloc]
                      initWithNibName:@"ConnectionView" bundle:nil];
  
    [[self view] addSubview:[connController view]];
    [connController setDelegate:self];
}

- (void) showDatabaseView
{
    NSLog(@"showDatabaseView()");
    
    // Remove the connection view
    [[connController view] removeFromSuperview];

    
    dbController = [[OLDatabaseController alloc]
                    initWithNibName:@"DatabaseView" bundle:nil];
    
    [[self view] addSubview:[dbController view]];
}

@end
