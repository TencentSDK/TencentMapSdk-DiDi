#
# Be sure to run `pod lib lint TencentMapSdk-DiDi.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "TencentMapSdk-DiDi"
#2.1.1.07表示版本号, 倒数第二位01 表示乘客, 02 表示专快司机, 03表示出租车司机, 最后一位每次同一版本有新的提交则+1,类似Build号
s.version          = "2.1.1.09.01.02"
s.summary          = "This is TencentMapSdk for DiDi."
s.description      = 'The Map Software develop kit.'
s.homepage         = "https://github.com/TencentSDK/TencentMapSdk-DiDi"
# s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'BSD'
s.author           = { "eximpression" => "ex_impression@hotmail.com" }
s.source           = { :git => "https://github.com/TencentSDK/TencentMapSdk-DiDi.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

s.platform     = :ios, '7.0'
s.requires_arc = true
s.source_files = 'TencentMapSdk-DiDi/Classes/**/*'

s.resources = 'TencentMapSdk-DiDi/Bundles/SOSOMAPRES.bundle'

s.vendored_libraries = [
'TencentMapSdk-DiDi/Library/libSOSOMAP.a'
]
s.public_header_files = 'TencentMapSdk-DiDi/Classes/include/*.h'
s.frameworks = 'SystemConfiguration','UIKit','CoreText','OpenGLES','QuartzCore','CoreGraphics','CoreLocation','CoreTelephony', 'Accelerate','ImageIO','JavaScriptCore'
s.ios.vendored_frameworks = 'TencentMapSdk-DiDi/Framework/TMapBeaconAPI_SDKBase.framework'
s.library = 'z','stdc++','stdc++.6.0.9','sqlite3'

end
