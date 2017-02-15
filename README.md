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
```ruby
#import "DPPageViewController.h"


DPPageViewController *pagevc = [[DPPageViewController alloc] initWithTitle:@"Page View Controller" viewControllers:@[vc1,vc2,vc3,vc4]];
[self.navigationController pushViewController:pagevc animated:YES];


```

## Author

413655409@qq.com, 413655409@qq.com

## License

DPPageViewController is available under the MIT license. See the LICENSE file for more info.
