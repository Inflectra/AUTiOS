#import <Foundation/Foundation.h>

@interface AUTItem : NSObject

@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end
