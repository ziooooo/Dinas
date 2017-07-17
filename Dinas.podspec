#
#  Be sure to run `pod spec lint Dinas.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Dinas"
  s.version      = "1.0.1"
  s.summary      = "Build your view's frame, like Masonry."
  s.description  = %{
    Build your view's frame, like Masonry...
  }

  s.homepage     = "https://github.com/ziooooo/Dinas"
  s.license      = "MIT"
  s.author       = { "ziooooo" => "54540908@qq.com" }

  s.source       = { :git => "https://github.com/ziooooo/Dinas.git", :tag => "#{s.version}" }

  s.source_files  = "Dinas/Dinas/*.{h,m}"

  s.ios.frameworks = 'Foundation', 'UIKit'

  s.ios.deployment_target = '6.0' # minimum SDK with autolayout
  s.requires_arc = true

end
