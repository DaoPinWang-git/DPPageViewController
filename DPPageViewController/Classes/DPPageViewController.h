//
//  DPPageViewController.h
//  DPIkcrm
//
//  Created by 王的 MacBook pro on 16/4/19.
//  Copyright © 2016年 王的 MacBook Pro. All rights reserved.
//

@import UIKit;
@class DPPageViewController;

@protocol DPPageViewControllerDelegate <NSObject>

@optional

- (void)pageViewController:(DPPageViewController *)pageViewController displayIndex:(NSInteger)index;

/**
 自定义小title
 */
- (void)pageViewController:(DPPageViewController *)pageViewController titleItem:(UIButton *)item;


@end

typedef enum : NSUInteger {
    /// 等宽（默认）
    ItemEqualWidth = 0,
    /// 等间距
    ItemEqualSpacing,
} ItemWidthStyle;


@interface DPPageViewController : UIViewController
@property (nonatomic, strong, readonly) UIView *headView;
@property (nonatomic, strong, readonly) UIScrollView *headScrollView;
@property (nonatomic, strong, readonly) UIScrollView *bodyView;
/// 当前显示的view
@property (nonatomic, strong, readonly) UIView *displayView;

/// 顶部的view使用时直接赋值（位置在headView上面，会根据滑动移动）
@property (nonatomic, strong) UIView *topView;

/// 中间的view使用时直接赋值
@property (nonatomic, strong) UIView *middleView;

/// 底部的view使用时直接赋值
@property (nonatomic, strong) UIView *bottomView;

/// 当前页的索引
@property (nonatomic, assign) NSInteger displayIndex;

/// 按钮高度 (默认50)
@property (nonatomic, assign) CGFloat itemHeight;

/// item宽度样式 默认ItemEqualWidth
@property (nonatomic, assign) ItemWidthStyle itemWidthStyle;

/// 按钮间距 (默认50) widthStyle = ItemEqualSpacing 有效
@property (nonatomic, assign) CGFloat itemSpace;

/// 按钮到左右两边的距离(默认10) widthStyle = ItemEqualSpacing 有效
@property (nonatomic, assign) CGFloat itemMarginLR;

/// 按钮最小宽度 (默认90) widthStyle = ItemEqualWidth 有效
@property (nonatomic, assign) CGFloat minItemWidth;

@property (nonatomic, weak) id<DPPageViewControllerDelegate> delegate;

@property (nonatomic, copy, readonly) NSArray<UIViewController *> *viewControllers;

/// 普通的颜色
@property (nonatomic, strong) UIColor *commonColor;

/// 选中的颜色
@property (nonatomic, strong) UIColor *selectColor;

/// title字体
@property (nonatomic, strong) UIFont *titleFont;

/// title字体大小
@property (nonatomic, assign, readonly) CGFloat titleSize;

/// 选中的title放大倍数 （默认1）
@property (nonatomic, assign) CGFloat selectTitleZoomMultiple;

/// title底部滑块
@property (nonatomic, strong) UIView *markLine;



- (instancetype)initWithTitle:(NSString *)title viewControllers:(NSArray<UIViewController *> *)viewControllers;

- (void)reloadView;

// 移动topView
- (void)moveTopViewByScrollView:(UIScrollView *)scrollView;

- (void)reloadViewControllers:(NSArray<UIViewController *> *)viewControllers;


//- (void)items:(NSArray *)items delegate:(id<DPPageViewControllerDelegate>) delegate;


@end





