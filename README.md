# DevKit

[![CI Status](https://img.shields.io/travis/jgsamudio/DevKit.svg?style=flat)](https://travis-ci.org/jgsamudio/DevKit)
[![Version](https://img.shields.io/cocoapods/v/DevKit.svg?style=flat)](https://cocoapods.org/pods/DevKit)
[![License](https://img.shields.io/cocoapods/l/DevKit.svg?style=flat)](https://cocoapods.org/pods/DevKit)
[![Platform](https://img.shields.io/cocoapods/p/DevKit.svg?style=flat)](https://cocoapods.org/pods/DevKit)

## Description

Collection of commonly used swift code. Documentation can be found [here](https://prolificinteractive.github.io/DevKit/).



## Usage

If you would like to integrate DevKit into your project, add the repo to your project as a git submodule.

`git submodule add https://github.com/prolificinteractive/DevKit`

In your podfile add DevKit as shown below:

```ruby
pod 'DevKit', :path => './DevKit'
```

Customizing DevKit with certain subspecs can be done as shown below. Subspecs can be found in the [documentation](https://prolificinteractive.github.io/DevKit/).

```ruby
pod 'DevKit', :path => './DevKit', :subspecs => ['Extensions/StringExtension',
                                                 'DataStructures/LinkedList']
```



## Contributing to DevKit

Adding new classes to DevKit should be added to the appropriate subspec section. Unique subspecs should include the source files, any limiting deployment targets and necessary dependencies. 

```ruby
  # CalendarPermissionsValidator
  s.subspec 'CalendarPermissionsValidator' do |sp|
    sp.ios.deployment_target = '11.0'
    sp.dependency 'DevKit/Extensions/StringExtension'
    sp.dependency 'DevKit/Extensions/UIAlertControllerExtension'
    sp.dependency 'DevKit/Extensions/UIApplicationExtension'
    sp.source_files = 'DevKit/DevKit/Classes/Utility/Validators/CalendarPermissionsValidator/*'
  end
```

Once all classes and files are added to the project make sure to:

* Run pod install on the example project

* Ensure the classes are added to the main DevKit Xcode workspace at ./DevKit/DevKit.xcworkspace

* Run `make documentation` at ./DevKit

All new additions should be code reviewed before merging into master.



## License

![prolific](https://s3.amazonaws.com/prolificsitestaging/logos/Prolific_Logo_Full_Color.png)

Copyright (c) 2017 Prolific Interactive

DevKit is maintained and sponsored by Prolific Interactive. It may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: ./LICENSE
