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

  s.ios.deployment_target = '9.0'

  s.source_files = 'DevKit/DevKit/Classes/**/*'

# ==== Views ================================================================================================================

  # TransitioningNavigationView
  s.subspec 'TransitioningNavigationView' do |sp|
    sp.dependency 'DevKit/SharedOptions/ShadowOptions'
    sp.dependency 'PureLayout', '~> 3.0.2'
    sp.dependency 'Marker', '~> 1.1.0'
    sp.source_files = 'DevKit/DevKit/Classes/Views/TransitioningNavigationView/*'
  end

# ==== Utility ==============================================================================================================

  # CalendarPermissionsValidator
  s.subspec 'CalendarPermissionsValidator' do |sp|
    sp.dependency 'DevKit/Extensions/StringExtension'
    sp.dependency 'DevKit/Extensions/UIAlertControllerExtension'
    sp.dependency 'DevKit/Extensions/UIApplicationExtension'
    sp.source_files = 'DevKit/DevKit/Classes/Utility/Validators/CalendarPermissionsValidator/*'
  end

  # ImagePickerValidator
  s.subspec 'ImagePickerValidator' do |sp|
    sp.dependency 'DevKit/Extensions/StringExtension'
    sp.source_files = 'DevKit/DevKit/Classes/Utility/Validators/ImagePickerValidator/*'
  end

# ==== Protocols ============================================================================================================

  # Validators
  s.subspec 'Protocols' do |sp|

    # KeyboardObserver
    sp.subspec 'KeyboardObserver' do |ssp|
      ssp.source_files = 'DevKit/DevKit/Classes/Protocols/KeyboardObserver/*'
    end

      # ReusableCell
    sp.subspec 'ReusableCell' do |ssp|
      ssp.source_files = 'DevKit/DevKit/Classes/Protocols/ReusableCell/*'
    end
  end

# ==== Extensions ===========================================================================================================

  s.subspec 'Extensions' do |sp|

    # String Extension
    sp.subspec 'StringExtension' do |ssp|
        ssp.source_files = 'DevKit/DevKit/Classes/Extensions/StringExtension/*'
    end

    # UIAlertController Extension
    sp.subspec 'UIAlertControllerExtension' do |ssp|
        ssp.source_files = 'DevKit/DevKit/Classes/Extensions/UIAlertControllerExtension/*'
    end

    # UIApplication Extension
    sp.subspec 'UIApplicationExtension' do |ssp|
        ssp.ios.deployment_target = '11.0'
        ssp.source_files = 'DevKit/DevKit/Classes/Extensions/UIApplicationExtension/*'
    end
  end

# ==== Shared Options =======================================================================================================

  s.subspec 'SharedOptions' do |sp|

    # Shadow Options
    sp.subspec 'ShadowOptions' do |ssp|
        ssp.source_files = 'DevKit/DevKit/Classes/SharedOptions/ShadowOptions.swift'
    end
  end

end
