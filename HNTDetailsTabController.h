//
//  HNTTableViewController.h
//  demo
//
//  Created by 东哥 on 2022/4/12.
//

#import "BaseNavigationController.h"

NS_ASSUME_NONNULL_BEGIN

@interface HNTDetailsTabController : BaseNavigationController

@property(nonatomic ,strong) NSArray<HNTAccountModel*>     *accountArr;

@property (nonatomic ,strong) NSDecimalNumber        *totalAmount;

@end

NS_ASSUME_NONNULL_END
