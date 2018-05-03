#
# Be sure to run `pod lib lint DevKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'DevKit'
  s.version          = '0.1.0'
  s.summary          = 'A short description of DevKit.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Collection of commonly used swift code.
                       DESC

  s.homepage         = 'https://github.com/prolificinteractive/DevKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'jgsamudio' => 'jonathan2457@gmail.com' }
  s.source           = { :git => 'https://github.com/prolificinteractive/DevKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'DevKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'DevKit' => ['DevKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
