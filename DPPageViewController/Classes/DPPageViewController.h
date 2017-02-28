//
//  DPPageViewController.h
//  DPIkcrm
//
//  Created by 王的 MacBook pro on 16/4/19.
//  Copyright © 2016年 王的 MacBook Pro. All rights reserved.
//

@import UIKit;


@interface DPPageViewController : UIViewController
@property (nonatomic, strong, readonly) UIView *headView;
@property (nonatomic, strong, readonly) UIScrollView *headScrollView;
@property (nonatomic, strong, readonly) UIScrollView *bodyView;


/// 中间的view使用时直接赋值
@property (nonatomic, strong) UIView *middleView;

/// 底部的view使用时直接赋值
@property (nonatomic, strong) UIView *bottomView;

/// 当前页的索引
@property (nonatomic, assign) NSInteger displayIndex;

/// 当前显示的view
@property (nonatomic, strong) UIView *displayView;

//@property (nonatomic, weak) id<DPPageViewControllerDelegate> delegate;

@property (nonatomic, copy, readonly) NSArray *viewControllers;

/// 普通的颜色
@property (nonatomic, strong) UIColor *commonColor;

/// 选中的颜色
@property (nonatomic, strong) UIColor *selectColor;

/// title字体大小
@property (nonatomic, assign) CGFloat titleSize;

/// 选中的title放大倍数 （默认1）
@property (nonatomic, assign) CGFloat selectTitleZoomMultiple;


- (id)initWithTitle:(NSString *)title viewControllers:(NSArray *)viewControllers;


//- (void)items:(NSArray *)items delegate:(id<DPPageViewControllerDelegate>) delegate;


@end




//@protocol DPPageViewControllerDelegate<NSObject>
//
//@required
//
//- (UIView *)pageViewController:(DPPageViewController *)pageViewController index:(NSInteger)index;
//
//@optional
//- (void)pageViewController:(DPPageViewController *)pageViewController doubleTapItem:(UIView *)bodySubview;
//
//- (void)pageViewController:(DPPageViewController *)pageViewController toBodySubview:(UIView *)bodySubview index:(NSInteger)index;
//
//- (void)pageViewController:(DPPageViewController *)pageViewController didScroll:(UIScrollView *)scrollView;
//
//
//@end


