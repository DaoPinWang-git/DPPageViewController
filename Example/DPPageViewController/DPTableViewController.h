//
//  DPTableViewController.h
//  DPPageViewController_Example
//
//  Created by dpwong on 2019/7/22.
//  Copyright © 2019 413655409@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DPPageViewController;
NS_ASSUME_NONNULL_BEGIN

@interface DPTableViewController : UITableViewController
@property (nonatomic, weak) DPPageViewController *pageViewController;
@end

NS_ASSUME_NONNULL_END
