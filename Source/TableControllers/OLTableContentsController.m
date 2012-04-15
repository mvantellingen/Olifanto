#import "OLTableContentsController.h"

@implementation OLTableContentsController


- (void) setConnection:(OLConnection *)newConnection
{
    connection = newConnection;
    [dataSource setConnection: newConnection];
    
}

- (void) selectTable:(NSString *)newTableName
{
    NSLog(@"Select table %@", newTableName);
    
    if (![tableName isEqualToString: newTableName]) {
        
        tableName = newTableName;
        [dataSource setTableName: newTableName];
    
        [dataSource reloadData];
        [self updateColumns];
    
        [tableView reloadData];
    }
    
}


- (void) updateColumns
{
    [self removeColumns];
    NSArray *columns = [dataSource getColumns];
    NSString *name;
    NSTableColumn *column;
    NSString *identifier;
    for (int i = 0, count = [columns count]; i < count; i++) {
        name = [columns objectAtIndex:i];
        identifier = [NSString stringWithFormat:@"%d", i];
        column = [[NSTableColumn alloc] initWithIdentifier: identifier]; 
        
        [[column headerCell] setStringValue: name];
        [tableView addTableColumn: column];
    }
}


- (void) removeColumns
{
    NSArray *columns = [tableView tableColumns];
    for (int i = [columns count] - 1; i >= 0; i--) {
        [tableView removeTableColumn: [columns objectAtIndex:i]];
    }
}


- (IBAction) paginationNextPage:(id)sender
{
    int page = [dataSource pageNum];
    page++;
    [dataSource setPageNum:page];
    
    [dataSource reloadData];
    [tableView reloadData];
}

- (IBAction) paginationPrevPage:(id)sender
{
    
}

- (void) viewPaginationSettings
{
    NSRect paginationViewFrame = [paginationView frame];
    
}

@end
