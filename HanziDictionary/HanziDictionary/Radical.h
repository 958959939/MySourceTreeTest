

#import <Foundation/Foundation.h>

@interface Radical : NSObject

@property(assign,nonatomic)int bsid;
@property(assign,nonatomic)int bihua;
@property(retain,nonatomic)NSString *title;

//@property(retain,nonatomic)

+(NSMutableArray *)findAll;

@end
