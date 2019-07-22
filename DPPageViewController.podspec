#
# Be sure to run `pod lib lint DPPageViewController.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DPPageViewController'
  s.version          = '1.0.2'
  s.summary          = '一个类似网易新闻页面切换的控件.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
一个类似网易新闻页面切换的控件.用两行代码就可以实现

DPPageViewController *pagevc = [[DPPageViewController alloc] initWithTitle:@"Page View Controller" viewControllers:@[vc1,vc2,vc3,vc4,vc5]];
[self.navigationController pushViewController:pagevc animated:YES];

                       DESC

  s.homepage         = 'https://github.com/DaoPinWong/DPPageViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dpwong' => '413655409@qq.com' }
  s.source           = { :git => 'https://github.com/DaoPinWong/DPPageViewController.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'DPPageViewController/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DPPageViewController' => ['DPPageViewController/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
    s.dependency 'Masonry', '1.0.2'
end
