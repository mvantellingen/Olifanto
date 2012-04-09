#import <Foundation/Foundation.h>
#import "OLDatabaseController.h"


@interface OLToolbarController : NSObject
{
    IBOutlet NSPopUpButton *databaseSelector;
    IBOutlet NSToolbarItem *queryItem;
    IBOutlet NSToolbarItem *contentItem;
    IBOutlet NSToolbar *toolBar;
    
    OLDatabaseController *dbController;
    NSString *currentDatabase;
}

- (void) setDbController:(id)newValue;

- (IBAction) openQueryView:(id)sender;
- (IBAction) openDatabase:(id)sender;
- (IBAction) openContentView:(id)sender;

@end
