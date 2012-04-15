#import <Foundation/Foundation.h>
#import "OLConnection.h"
#import "OLTableResultView.h"
#import "OLTableContentsDatasource.h"


@interface OLTableContentsController : NSObject
{
    IBOutlet NSTableView *tableView;
    IBOutlet NSButton *paginationNextButton;
    IBOutlet NSButton *paginationPrevButton;
    IBOutlet NSButton *paginationViewButton;
    
    IBOutlet NSView *paginationView;
    
    IBOutlet OLTableContentsDatasource *dataSource;
    
    
    OLConnection *connection;
    NSString *tableName;
    
    int limit;
    int offset;
}

- (id) init;
- (void) selectTable:(NSString *)tableName;
- (void) setConnection:(OLConnection *)newConnection;

- (IBAction)paginationNextPage:(id)sender;
- (IBAction)paginationPrevPage:(id)sender;

@end
