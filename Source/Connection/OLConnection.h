#import <Foundation/Foundation.h>
#import <PGCconnection.h>
#import "OLQueryResult.h"

@interface OLConnection : NSObject {
    
}

@property (assign) NSString *name;
@property (assign) NSString *hostname;
@property (assign) NSString *username;
@property (assign) NSString *password;

@property (assign) PGCconnection *conn;

- (id) initWithDictionary:(NSDictionary *) data;
- (NSDictionary *) serialize;
- (NSArray *) getDatabases;
- (NSArray *) getTables;
- (BOOL) selectDatabase: (NSString *)database;
- (PGCconnection *) _connectWithDatabase:(NSString *)theDatabase;
- (OLQueryResult *) executeQuery:(NSString *)statement;

@end
