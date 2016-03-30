#
# Be sure to run `pod lib lint PushServicesLibrary.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "PushServicesLibrary"
  s.version          = "1.0.0"
  s.summary          = "Push Services Library"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!  
#  s.description      = <<-DESC
#                       DESC

  s.homepage         = "https://github.com/devalios/PushServicesLibrary"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "devalios" => "info@techmobilesoft.com" }
  s.source           = { :git => "https://github.com/devalios/PushServicesLibrary.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/devalios'

  s.platform     = :ios, '7.0'
  s.ios.deployment_target = '7.0'
  s.requires_arc = true

#s.source_files = 'Pod/Classes/**/*'
s.source_files = 'Pod/Classes/*.h'
s.vendored_libraries = 'Pod/Classes/*.a'
  s.resource_bundles = {
    'PushServicesLibrary' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'Foundation', 'SystemConfiguration'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.xcconfig     = {'OTHER_LDFLAGS' => '-ObjC' }
end
