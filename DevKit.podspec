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
  s.author           = { 'jgsamudio' => 'jonathan@prolificinteractive.com' }
  s.source           = { :git => 'https://github.com/prolificinteractive/DevKit.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  root_path = 'ios/DevKit/DevKit/Classes'

  s.source_files = "#{root_path}/*"

# ==== Views ============================================

  # TransitioningNavigationView
  s.subspec 'TransitioningNavigationView' do |sp|
    sp.dependency 'DevKit/SharedOptions/ShadowOptions'
    sp.dependency 'PureLayout', '~> 3.0.2'
    sp.dependency 'Marker', '~> 1.1.0'
    sp.source_files = "#{root_path}/Views/TransitioningNavigationView/*"
  end

  # LoadingIndicator
  s.subspec 'LoadingIndicator' do |sp|
      sp.source_files = "#{root_path}//Views/LoadingIndicator/*"
  end

  # InfinityPageControl
  s.subspec 'InfinityPageControl' do |sp|
      sp.source_files = "#{root_path}/Views/InfinityPageControl/*"
  end

# ==== Validation =====================================

  s.subspec 'Validation' do |sp|
     sp.source_files = "#{root_path}/Validation/*"
  end

# ==== Utility ============================================

  s.subspec 'Utility' do |sp|

    sp.source_files = "#{root_path}/Utility/*"

    # CalendarPermissionsValidator
    sp.subspec 'CalendarPermissionsValidator' do |ssp|
      ssp.ios.deployment_target = '11.0'
      ssp.dependency 'DevKit/Extensions/StringExtension'
      ssp.dependency 'DevKit/Extensions/UIAlertControllerExtension'
      ssp.dependency 'DevKit/Extensions/UIApplicationExtension'
      ssp.source_files = "#{root_path}/Utility/Validators/CalendarPermissionsValidator/*"
    end

    # ImagePickerValidator
    sp.subspec 'ImagePickerValidator' do |ssp|
      ssp.dependency 'DevKit/Extensions/StringExtension'
      ssp.source_files = "#{root_path}/Utility/Validators/ImagePickerValidator/*"
    end

    # KeyboardObserver
    sp.subspec 'KeyboardObserver' do |ssp|
        ssp.source_files = "#{root_path}/Utility/KeyboardObserver/*"
    end

    # ReusableView
    sp.subspec 'ReusableView' do |ssp|
        ssp.source_files = "#{root_path}/Utility/ReusableView/*"
    end

    # SessionManager
    sp.subspec 'SessionManager' do |ssp|
        ssp.source_files = "#{root_path}/Utility/SessionManager/*"
        ssp.dependency 'KeychainAccess', '3.1.0'
    end

    # KillSwitchProvider
    sp.subspec 'KillSwitchProvider' do |ssp|
        ssp.source_files = "#{root_path}/Utility/KillSwitchProvider/*"
        ssp.dependency 'Bellerophon', '1.2.0'
        ssp.dependency 'DevKit/Utility/APIError'
    end

    # HTTPClient
    sp.subspec 'HTTPClient' do |ssp|
        ssp.source_files = "#{root_path}/Utility/HTTPClient/*"
        ssp.dependency 'Alamofire', '4.7.2'
    end

    # APIError
    sp.subspec 'APIError' do |ssp|
        ssp.source_files = "#{root_path}/Utility/APIError/*"
        ssp.dependency 'Bellerophon', '1.2.0'
    end

    # Haptics
    sp.subspec 'Haptics' do |ssp|
        ssp.source_files = "#{root_path}/Utility/Haptics/*"
    end
  end

# ==== Extensions ============================================

  s.subspec 'Extensions' do |sp|

    sp.source_files = "#{root_path}/Extensions/*"

    # String Extension
    sp.subspec 'StringExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/StringExtension/*"
    end

    # UIAlertController Extension
    sp.subspec 'UIAlertControllerExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/UIAlertControllerExtension/*"
    end

    # UIApplication Extension
    sp.subspec 'UIApplicationExtension' do |ssp|
        ssp.ios.deployment_target = '11.0'
        ssp.source_files = "#{root_path}/Extensions/UIApplicationExtension/*"
    end

    # UITableView Extension
    sp.subspec 'UITableViewExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/UITableViewExtension/*"
        sp.dependency 'DevKit/Utility/ReusableView'
    end

    # UIColor Extension
    sp.subspec 'UIColorExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/UIColorExtension/*"
    end

    # UIImage Extension
    sp.subspec 'UIImageExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/UIImageExtension/*"
    end

    # TextStyle Extension
    sp.subspec 'TextStyleExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/TextStyleExtension/*"
    end

    # DateFormatter Extension
    sp.subspec 'DateFormatterExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/DateFormatterExtension/*"
    end

    # CALayer Extension
    sp.subspec 'CALayerExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/CALayerExtension/*"
    end

    # Bundle Extension
    sp.subspec 'BundleExtension' do |ssp|
        ssp.source_files = "#{root_path}/Extensions/BundleExtension/*"
    end
  end

# ==== Shared Options ============================================

  s.subspec 'SharedOptions' do |sp|

    # Shadow Options
    sp.subspec 'ShadowOptions' do |ssp|
        ssp.source_files = "#{root_path}/SharedOptions/ShadowOptions.swift"
    end
  end

# ==== Data Structures  ============================================

  s.subspec 'DataStructures' do |sp|

    # Linked List
    sp.subspec 'LinkedList' do |ssp|
        ssp.source_files = "#{root_path}/Data\ Structures/Linked\ List/*"
    end

    # Stack
    sp.subspec 'Stack' do |ssp|
        ssp.source_files = "#{root_path}/Data\ Structures/Stack/*"
    end
  end

end
