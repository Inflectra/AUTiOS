#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AUTItem;

@interface AUTDoc : NSObject

@property (strong) AUTItem *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;

- (id)initWithTitle:(NSString*)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage;

@end