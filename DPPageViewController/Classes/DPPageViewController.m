//
//  DPPageViewController.m
//  DPIkcrm
//
//  Created by 王的 MacBook pro on 16/4/19.
//  Copyright © 2016年 王的 MacBook Pro. All rights reserved.
//

#import "DPPageViewController.h"
#import "Masonry.h"




#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]



@interface DPPageViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIView *topSuperView;
@property (nonatomic, strong) UIPanGestureRecognizer *moveTopViewByGesture;
@property (nonatomic, assign) CGPoint moveTopViewLastPoint;
@property (nonatomic, strong) UIView *middleSuperView;
@property (nonatomic, strong) UIView *bottomSuperView;
@property (nonatomic, strong) UIImageView *markLine;

@property (nonatomic, assign) CGFloat commonR;
@property (nonatomic, assign) CGFloat commonG;
@property (nonatomic, assign) CGFloat commonB;
@property (nonatomic, assign) CGFloat commonA;


@property (nonatomic, assign) CGFloat selectR;
@property (nonatomic, assign) CGFloat selectG;
@property (nonatomic, assign) CGFloat selectB;
@property (nonatomic, assign) CGFloat selectA;

@property (nonatomic, assign) CGFloat allHeadItemX;
@property (nonatomic, assign) CGFloat itemWidth;


@end

@implementation DPPageViewController
@synthesize displayView = _displayView;
@synthesize viewControllers = _viewControllers;


- (id)initWithTitle:(NSString *)title viewControllers:(NSArray *)viewControllers{
    self = [self init];
    if (self) {
        self.title = title;
        self.commonR = 139;
        self.commonG = 139;
        self.commonB = 139;
        self.commonA = 1.0;
        
        self.selectR = 241;
        self.selectG = 75;
        self.selectB = 60;
        self.selectA = 1.0;
        
        self.titleSize = 14;
        self.selectTitleZoomMultiple = 1.0;
        
        self.itemHeight = 50;
        self.minItemWidth = 90;
        
        self.itemWidth = 0;
        self.itemWidth = [[UIScreen mainScreen] bounds].size.width / viewControllers.count;
        
        

        
        _viewControllers = viewControllers;
        
        [self view];
    }
    return self;
}

- (void)setTopView:(UIView *)topView{
    [self setTopView:topView animate:NO];
}

- (void)setTopView:(UIView *)topView animate:(BOOL)animate{
    if (topView == nil) {
        [UIView animateWithDuration:animate ? 0.3 : 0 animations:^{
            [self.topSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);

            }];
            [self.view layoutIfNeeded];


        } completion:^(BOOL finished) {
            [self->_topView removeFromSuperview];
            self->_topView = topView;
        }];
    }else{

        [_topView removeFromSuperview];
        _topView = topView;
        [self.topSuperView addSubview:topView];
        [topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.topSuperView);
        }];
        [UIView animateWithDuration:animate ? 0.3 : 0 animations:^{

            [self.topSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(topView.bounds.size.height);
            }];

            [self.view layoutIfNeeded];
        }];

    }
}

- (void)setMiddleView:(UIView *)middleView{
    [self setMiddleView:middleView animate:NO];
}

- (void)setMiddleView:(UIView *)middleView animate:(BOOL)animate{
    
    
    if (middleView == nil) {
        [UIView animateWithDuration:animate ? 0.3 : 0 animations:^{
            [self.middleSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
            [self.view layoutIfNeeded];

           
        } completion:^(BOOL finished) {
            [self->_middleView removeFromSuperview];
            self->_middleView = middleView;
        }];
    }else{
        [_middleView removeFromSuperview];
        _middleView = middleView;
        [self.middleSuperView addSubview:middleView];
        [middleView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.middleSuperView);
        }];
        [UIView animateWithDuration:animate ? 0.3 : 0 animations:^{
            
            [self.middleSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(middleView.bounds.size.height);
            }];
            
            [self.view layoutIfNeeded];
        }];
        
    }
    
}



- (void)setBottomView:(UIView *)bottomView{
    [self setBottomView:bottomView animate:NO];
}

- (void)setBottomView:(UIView *)bottomView animate:(BOOL)animate{
    
    
    if (bottomView == nil) {
        [UIView animateWithDuration:animate ? 0.3 : 0 animations:^{
            [self.bottomSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
                make.bottom.equalTo(self.view).offset(0);

            }];
            [self.view layoutIfNeeded];

        } completion:^(BOOL finished) {
            [self->_bottomView removeFromSuperview];
            self->_bottomView = bottomView;
        }];
    }else{
        [_bottomView removeFromSuperview];
        _bottomView = bottomView;
        [self.bottomSuperView addSubview:bottomView];
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.bottomSuperView);
        }];
        self.bottomSuperView.backgroundColor = bottomView.backgroundColor;
        [UIView animateWithDuration:animate ? 0.3 : 0 animations:^{
            
            [self.bottomSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(bottomView.bounds.size.height);
                if (@available(iOS 11.0, *)) {
                    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
                    make.bottom.equalTo(self.view).offset(-window.safeAreaInsets.bottom);
                } else {
                    make.bottom.equalTo(self.view).offset(0);
                }
            }];
            
            [self.view layoutIfNeeded];
        }];
        
    }
    
}

- (UIView *)topSuperView{
    if (_topSuperView == nil) {
        _topSuperView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0)];
        _topSuperView.clipsToBounds = YES;
        _topSuperView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_topSuperView];
        _moveTopViewByGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(moveTopViewByGesture:)];

        [_topSuperView addGestureRecognizer:_moveTopViewByGesture];
    }
    return _topSuperView;
}


- (UIView *)middleSuperView{
    if (_middleSuperView == nil) {
        _middleSuperView = [[UIView alloc] initWithFrame:CGRectMake(0, self.itemHeight, self.view.frame.size.width, 0)];
        _middleSuperView.clipsToBounds = YES;
        _middleSuperView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_middleSuperView];
    }
    return _middleSuperView;
}


- (UIView *)bottomSuperView{
    if (_bottomSuperView == nil) {
        _bottomSuperView = [[UIView alloc] initWithFrame:CGRectMake(0, self.itemHeight, self.view.frame.size.width, 0)];
        _bottomSuperView.clipsToBounds = YES;
        _bottomSuperView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [self.view addSubview:_bottomSuperView];
    }
    return _bottomSuperView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;

    self.view.backgroundColor = [UIColor whiteColor];

    self.itemWidth = self.itemWidth < self.minItemWidth ? self.minItemWidth : self.itemWidth;
    
    [self creationView];
    [self reloadView];
    
}

- (UIView *)displayView{
    return _displayView;
}

- (NSArray *)viewControllers{
    return _viewControllers;
}


- (void)setCommonColor:(UIColor *)commonColor{
    _commonColor = commonColor;
    CGFloat components[4];
    [self getRGBComponents:components forColor:commonColor];
    self.commonR = components[0];
    self.commonG = components[1];
    self.commonB = components[2];
    self.commonA = components[3];

    
    for (UIButton *but in self.headScrollView.subviews) {
        if ([but isKindOfClass:[UIButton class]]) {
            if (but.tag - 1 == self.displayIndex) {
                [but setTitleColor:RGBA(self.selectR,self.selectG,self.selectB,self.selectA) forState:UIControlStateNormal];
            }else{
                [but setTitleColor:RGBA(self.commonR,self.commonG,self.commonB,self.commonA) forState:UIControlStateNormal];
            }
        }
        
    }
}


- (void)setSelectColor:(UIColor *)selectColor{
    _selectColor = selectColor;
    CGFloat components[4];
    [self getRGBComponents:components forColor:selectColor];
    self.selectR = components[0];
    self.selectG = components[1];
    self.selectB = components[2];
    self.selectA = components[3];

    
    for (UIButton *but in self.headScrollView.subviews) {
        if ([but isKindOfClass:[UIButton class]]) {
            if (but.tag - 1 == self.displayIndex) {
                [but setTitleColor:RGBA(self.selectR,self.selectG,self.selectB,self.selectA) forState:UIControlStateNormal];
            }else{
                [but setTitleColor:RGBA(self.commonR,self.commonG,self.commonB,self.commonA) forState:UIControlStateNormal];
            }
        }
        
    }
    self.markLine.backgroundColor = selectColor;

    
    
}


- (void)getRGBComponents:(CGFloat [4])components forColor:(UIColor *)color {
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    
    for (int component = 0; component < 4; component++) {
        components[component] = resultingPixel[component];
    }
}


- (void)setSelectTitleZoomMultiple:(CGFloat)selectTitleZoomMultiple{
    _selectTitleZoomMultiple = selectTitleZoomMultiple;
    for (UIButton *but in self.headScrollView.subviews) {
        if ([but isKindOfClass:[UIButton class]]) {
            if (but.tag - 1 == self.displayIndex) {
                but.titleLabel.font = [but.titleLabel.font fontWithSize:self.titleSize * self.selectTitleZoomMultiple];
            }else{
                but.titleLabel.font = [but.titleLabel.font fontWithSize:self.titleSize];
            }
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}


- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
}

- (void)creationView{
    
    _headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.itemHeight)];
    self.headView.clipsToBounds = YES;
    self.headView.backgroundColor = [UIColor whiteColor];
    self.headView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.headView.hidden = self.viewControllers.count == 1;
    [self.view addSubview:self.headView];
    
    _headScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.headView.frame.size.width, self.headView.frame.size.height)];
    [self.headScrollView setShowsHorizontalScrollIndicator:NO];
    [self.headScrollView setShowsVerticalScrollIndicator:NO];

    self.headScrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.headScrollView.tag = 999;
    [self.headView addSubview:self.headScrollView];
    
    self.markLine = [UIImageView new];
    self.markLine.backgroundColor = self.selectColor;
    self.markLine.tag = 999;
    [self.headScrollView addSubview:self.markLine];

    
    _bodyView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                   CGRectGetMaxY(self.middleSuperView.frame),
                                                                   self.view.frame.size.width,
                                                                   self.view.frame.size.height - CGRectGetMaxY(self.middleSuperView.frame))];
    [self.bodyView setShowsHorizontalScrollIndicator:NO];
    [self.bodyView setShowsVerticalScrollIndicator:NO];
    self.bodyView.delegate = self;
    self.bodyView.pagingEnabled = YES;
    self.bodyView.bounces = NO;
    self.bodyView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.bodyView];
    
    UIImageView *lineImage = [[UIImageView alloc] init];
    lineImage.backgroundColor = [UIColor lightGrayColor];
    [self.headView addSubview:lineImage];
    [lineImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.bottom.equalTo(self.headView);
        make.height.mas_equalTo(0.5);
    }];

    [self.topSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(self.view);
        make.top.equalTo(self.view);
        make.height.mas_equalTo(0);
    }];
    
    
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(self.view);
        make.top.equalTo(self.topSuperView.mas_bottom);
        if (self.viewControllers.count == 1) {
            make.height.mas_equalTo(0);
        }else{
            make.height.mas_equalTo(self.itemHeight);
        }
    }];
    

    
    [self.headScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.headView);
    }];
    
    [self.middleSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.equalTo(self.view);
        make.top.equalTo(self.headView.mas_bottom);
        make.height.mas_equalTo(0);
    }];
    
    [self.bodyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.middleSuperView.mas_bottom);
        make.right.and.left.equalTo(self.view);
        make.bottom.equalTo(self.bottomSuperView.mas_top);

    }];
    
    
    [self.bottomSuperView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.and.left.and.bottom.equalTo(self.view);
        make.height.mas_equalTo(0);
    }];
    
  
    
    
}

- (void)moveTopViewByScrollView:(UIScrollView *)scrollView{
    CGFloat h = self.topSuperView.frame.origin.y - scrollView.contentOffset.y;
    BOOL isReset = YES;
    if (fabs(h) > self.topSuperView.frame.size.height) {
        h = -self.topSuperView.frame.size.height;
        isReset = NO;
    }
    if (h > 0) {
        h = 0;
        isReset = NO;
    }
    if (isReset) {
        scrollView.contentOffset = CGPointZero;
    }

    [self.topSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(h);
    }];
}

- (void)moveTopViewByGesture:(UIPanGestureRecognizer *)gesture{
    if (gesture.state == UIGestureRecognizerStateBegan) {
        self.moveTopViewLastPoint = [gesture translationInView:self.view];
    }else if (gesture.state == UIGestureRecognizerStateChanged){
        CGPoint point = [gesture translationInView:self.view];

        CGFloat distance = self.moveTopViewLastPoint.y - point.y;
        CGFloat h = self.topSuperView.frame.origin.y - distance;

        if (fabs(h) > self.topSuperView.frame.size.height) {
            h = -self.topSuperView.frame.size.height;
        }
        if (h > 0) {
            h = 0;
        }

        [self.topSuperView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(h);
        }];

        self.moveTopViewLastPoint = point;

    }
}


- (void)reloadView{
    
    for (UIView *view in self.headScrollView.subviews) {
        if ([view isKindOfClass:[UIButton class]]) {
            [view removeFromSuperview];
        }
    }
    
    for (UIView *view in self.bodyView.subviews) {
        [view removeFromSuperview];
    }
    
    self.allHeadItemX = 0;
//    [self bodyViewSubView:0];
    CGFloat contentWidth = self.viewControllers.count * self.bodyView.frame.size.width;
    self.bodyView.contentSize = CGSizeMake(contentWidth, 0);

    
    for (NSInteger i = 0; i < self.viewControllers.count; i ++) {
        [self headScrollViewSubView:i];
        [self bodyViewSubView:i];

    }

    [self headVoewMoveToIndex:self.displayIndex animated:NO];
    [self bodyViewMoveToIndex:self.displayIndex animated:NO];
    
    UIViewController *vc = [self.viewControllers firstObject];
    self.navigationItem.rightBarButtonItem = vc.navigationItem.rightBarButtonItem;
}


- (void)headScrollViewSubView:(NSInteger)index{
    UIViewController *VC = [self.viewControllers objectAtIndex:index];
    self.navigationItem.rightBarButtonItem = VC.navigationItem.rightBarButtonItem;
    UIButton *but = [UIButton buttonWithType:UIButtonTypeCustom];
    but.titleLabel.font = [but.titleLabel.font fontWithSize:self.titleSize];

    //    but.titleLabel.adjustsFontSizeToFitWidth = YES;
    
    [but setTitle:VC.title forState:UIControlStateNormal];
    
    [but addTarget:self action:@selector(changeCategory:) forControlEvents:UIControlEventTouchUpInside];
    but.tag = index + 1;
    
    CGFloat itemWidth = self.itemWidth;
    but.frame = CGRectMake(self.allHeadItemX, 0, itemWidth, self.itemHeight);
    self.allHeadItemX += itemWidth;

    [self.headScrollView addSubview:but];
    if ([self.delegate respondsToSelector:@selector(pageViewController:titleItem:)]) {
        [self.delegate pageViewController:self titleItem:but];
    }
    
    
    if (index == self.displayIndex) {
        CGRect btnRect = but.frame;
        self.markLine.frame = CGRectMake(CGRectGetMinX(btnRect), CGRectGetMaxY(btnRect) - 2, CGRectGetWidth(btnRect), 2);
        [but setTitleColor:RGBA(self.selectR,self.selectG,self.selectB,self.selectA) forState:UIControlStateNormal];
        but.titleLabel.font = [but.titleLabel.font fontWithSize:self.titleSize * self.selectTitleZoomMultiple];

        
    }else{
        [but setTitleColor:RGBA(self.commonR,self.commonG,self.commonB,self.commonA) forState:UIControlStateNormal];
        but.titleLabel.font = [but.titleLabel.font fontWithSize:self.titleSize];
    }
    
    
    CGFloat contentWidth = self.allHeadItemX;
    if (contentWidth <= self.view.frame.size.width) {
        contentWidth = self.view.frame.size.width + 1;
    }
    self.headScrollView.contentSize = CGSizeMake(contentWidth, 0);
}


- (void)changeCategory:(id)sender{
    UIButton *but = (UIButton *)sender;
    [self headVoewMoveToIndex:but.tag - 1 animated:YES];
    [self bodyViewMoveToIndex:but.tag - 1 animated:YES];
}


- (void)bodyViewSubView:(NSInteger)index{
    
    UIViewController *vc = [self.viewControllers objectAtIndex:index];
    UIView *view = vc.view;
    view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    view.frame = CGRectMake(index * self.bodyView.frame.size.width,
                            0,
                            self.bodyView.frame.size.width,
                            self.bodyView.frame.size.height);
    view.tag = index + 1;
    
    [self.bodyView addSubview:view];
    [self addChildViewController:vc];
    
}



- (void)headVoewMoveToItem:(UIButton *)item animated:(BOOL)animated{
    
    CGFloat CItemPointX = CGRectGetMidX([item.superview convertRect:item.frame toView:self.view]);
    CGFloat CHeadPointX = CGRectGetMidX([self.headScrollView.superview convertRect:self.headScrollView.frame toView:self.view]);
    
    CGFloat offsetX = self.headScrollView.contentOffset.x + (CItemPointX - CHeadPointX);
    if (offsetX <= 0) {
        offsetX = 0;
    }
    if (offsetX >= self.headScrollView.contentSize.width - self.headScrollView.frame.size.width) {
        offsetX = self.headScrollView.contentSize.width - self.headScrollView.frame.size.width;
    }
    
    
    [self.headScrollView setContentOffset:CGPointMake(offsetX, self.headScrollView.contentOffset.y) animated:animated];

}

- (void)headVoewMoveToIndex:(NSInteger)index animated:(BOOL)animated{
    
    
    [self headVoewMoveToItem:(UIButton *)[self.headScrollView viewWithTag:index + 1] animated:animated];
    
}


- (void)bodyViewMoveToIndex:(NSInteger)index animated:(BOOL)animated{
    
    UIView *markView = nil;
    for (UIView *view in self.bodyView.subviews) {
        if (view.tag == index + 1) {
            markView = view;
        }
    }
    
    if (markView == nil) {
        [self bodyViewSubView:index];
    }
    float vButtonOrigin = index * self.bodyView.frame.size.width;
    [self.bodyView setContentOffset:CGPointMake(vButtonOrigin, self.bodyView.contentOffset.y) animated:animated];
    [self changeDisplayViewController:index];

}

- (void)changeDisplayViewController:(NSInteger)index{

    UIViewController *disVC = [self.viewControllers objectAtIndex:self.displayIndex];
    [disVC viewWillDisappear:YES];
    [disVC viewDidDisappear:YES];

    self.displayIndex = index;
    if ([self.delegate respondsToSelector:@selector(pageViewController:displayIndex:)]) {
        [self.delegate pageViewController:self displayIndex:index];
    }

    for (UIView *view in self.bodyView.subviews) {
        if (view.tag == index + 1) {
            _displayView = view;
            break;
        }
    }

    UIViewController *apperVC = [self.viewControllers objectAtIndex:self.displayIndex];
    [apperVC viewWillAppear:YES];
    [apperVC viewDidAppear:YES];
}




#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self changeView:scrollView.contentOffset.x];
}


- (void)changeView:(float)x
{
    CGFloat xx = x * (self.itemWidth / self.bodyView.frame.size.width);
    
    CGFloat startX = xx;
    //    float endX = xx + MENU_BUTTON_WIDTH;
    NSInteger sT = (x)/self.bodyView.frame.size.width + 1;
    if (sT <= 0)
    {
        return;
    }
    for (UIButton *but in self.headScrollView.subviews) {
        
        if ([but isKindOfClass:[UIButton class]]) {
            if (but.tag == sT || but.tag == sT + 1 || but.tag == sT - 1) {
                continue;
            }
            [but setTitleColor:RGBA(self.commonR,
                                    self.commonG,
                                    self.commonB,
                                    self.commonA) forState:UIControlStateNormal];
            
            but.titleLabel.font = [but.titleLabel.font fontWithSize:self.titleSize];


        }
        
    }
    
    
    UIButton *btn = (UIButton *)[self.headScrollView viewWithTag:sT];
    float percent = (startX - self.itemWidth * (sT - 1))/self.itemWidth;
    [btn setTitleColor:RGBA([self colorChangelerp:percent start:self.selectR to:self.commonR],
                            [self colorChangelerp:percent start:self.selectG to:self.commonG],
                            [self colorChangelerp:percent start:self.selectB to:self.commonB],
                            [self colorChangelerp:percent start:self.selectA to:self.commonA]) forState:UIControlStateNormal];
    

    
    CGFloat btnS = [self colorChangelerp:percent start:self.titleSize * self.selectTitleZoomMultiple to:self.titleSize];
    btn.titleLabel.font = [btn.titleLabel.font fontWithSize:btnS];


    NSInteger w = self.itemWidth;
    if((NSInteger)xx%w == 0)
        return;
    UIButton *btn2 = (UIButton *)[self.headScrollView viewWithTag:sT + 1];
    [btn2 setTitleColor:RGBA([self colorChangelerp:percent start:self.commonR to:self.selectR],
                             [self colorChangelerp:percent start:self.commonG to:self.selectG],
                             [self colorChangelerp:percent start:self.commonB to:self.selectB],
                             [self colorChangelerp:percent start:self.commonA to:self.selectA]) forState:UIControlStateNormal];
    
    
    CGFloat btnS2 = [self colorChangelerp:percent start:self.titleSize to:self.titleSize * self.selectTitleZoomMultiple];
    btn2.titleLabel.font = [btn2.titleLabel.font fontWithSize:btnS2];

    
    
    CGRect btn1Rect = btn.frame;

    CGRect btn2Rect = btn2.frame;
    
    self.markLine.frame = CGRectMake([self colorChangelerp:percent start:CGRectGetMinX(btn1Rect) to:CGRectGetMinX(btn2Rect)],
                                     CGRectGetMaxY(btn1Rect) - 2,
                                     [self colorChangelerp:percent start:CGRectGetWidth(btn1Rect) to:CGRectGetWidth(btn2Rect)],
                                     2);
    
    

    
}

- (CGFloat)colorChangelerp:(CGFloat)percent start:(CGFloat)start to:(CGFloat)to{
    CGFloat result = start;
    result = result + percent * (to - start);
    return result;
}


- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self changeView:scrollView.contentOffset.x];

    
    NSInteger index = scrollView.contentOffset.x / self.view.frame.size.width;
    
    UIView *markView = nil;
    for (UIView *view in self.bodyView.subviews) {
        if (view.tag == index + 1) {
            markView = view;
        }
    }
    
    if (markView == nil) {
        [self bodyViewSubView:index];
    }
    
    
    [self headVoewMoveToIndex:index animated:YES];
    
    [self changeDisplayViewController:index];
    
}


- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    [self changeView:scrollView.contentOffset.x];

}

@end
