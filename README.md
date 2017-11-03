# DPPageViewController

[![CI Status](http://img.shields.io/travis/413655409@qq.com/DPPageViewController.svg?style=flat)](https://travis-ci.org/413655409@qq.com/DPPageViewController)
[![Version](https://img.shields.io/cocoapods/v/DPPageViewController.svg?style=flat)](http://cocoapods.org/pods/DPPageViewController)
[![License](https://img.shields.io/cocoapods/l/DPPageViewController.svg?style=flat)](http://cocoapods.org/pods/DPPageViewController)
[![Platform](https://img.shields.io/cocoapods/p/DPPageViewController.svg?style=flat)](http://cocoapods.org/pods/DPPageViewController)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DPPageViewController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DPPageViewController"
```

## Usage

### Quick to use
```ruby
#import "DPPageViewController.h"


DPPageViewController *pagevc = [[DPPageViewController alloc] initWithTitle:@"Page View Controller" viewControllers:@[vc1,vc2,vc3,vc4,vc5]];
[self.navigationController pushViewController:pagevc animated:YES];


```

![](https://github.com/DaoPinWong/DPPageViewController/blob/master/Example/DPPageViewController/2017-02-15%2015_58_51.gif?raw=true)

### property  
```ruby

/// 中间的view使用时直接赋值
@property (nonatomic, strong) UIView *middleView;

/// 底部的view使用时直接赋值
@property (nonatomic, strong) UIView *bottomView;

/// 当前页的索引
@property (nonatomic, assign) NSInteger displayIndex;

/// 当前显示的view
@property (nonatomic, strong) UIView *displayView;

@property (nonatomic, copy, readonly) NSArray *viewControllers;

/// 普通的颜色
@property (nonatomic, strong) UIColor *commonColor;

/// 选中的颜色
@property (nonatomic, strong) UIColor *selectColor;

/// title字体大小
@property (nonatomic, assign) CGFloat titleSize;

/// 选中的title放大倍数 （默认1）
@property (nonatomic, assign) CGFloat selectTitleZoomMultiple;

```

### More  

```ruby

    pagevc.itemHeight = 40;
    pagevc.minItemWidth = 70;
    pagevc.selectTitleZoomMultiple = 1.5;
    pagevc.commonColor = [UIColor blueColor];
    pagevc.selectColor = [UIColor redColor];
    
    UIView *middleView = [UIView new];
    middleView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    UILabel *middleLabel = [UILabel new];
    middleLabel.textAlignment = NSTextAlignmentCenter;
    middleLabel.text = @"Middle View";
    [middleView addSubview:middleLabel];
    middleLabel.frame = middleView.bounds;
    pagevc.middleView = middleView;
    
    
    UIView *bottomView = [UIView new];
    bottomView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50);
    UILabel *bottomLabel = [UILabel new];
    bottomLabel.textAlignment = NSTextAlignmentCenter;
    bottomLabel.text = @"Bottom View";
    [bottomView addSubview:bottomLabel];
    bottomLabel.frame = bottomView.bounds;
    pagevc.bottomView = bottomView;
```
![](https://github.com/DaoPinWong/DPPageViewController/blob/master/Example/DPPageViewController/2017-02-15%2016_32_29.gif?raw=true)

## Author
dpwong, 413655409@qq.com

## License

DPPageViewController is available under the MIT license. See the LICENSE file for more info.
