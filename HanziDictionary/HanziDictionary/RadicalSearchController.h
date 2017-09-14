

#import <UIKit/UIKit.h>

@interface RadicalSearchController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (retain, nonatomic) UIView *topView;

@property (retain,nonatomic)UITableView *tbView;

@property(retain,nonatomic)NSArray *bsArray;//得到的部首对象array

@property(retain,nonatomic)NSMutableDictionary *bsDic;//把按部首笔画分为的数组放入字典中，关键字为笔画数的字符串

@property(retain,nonatomic)NSArray *allKeys;//bsDic字典的所有关键字



@end
