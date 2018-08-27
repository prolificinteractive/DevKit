# DevKit

[![CI Status](https://img.shields.io/travis/jgsamudio/DevKit.svg?style=flat)](https://travis-ci.org/jgsamudio/DevKit)
[![Version](https://img.shields.io/cocoapods/v/DevKit.svg?style=flat)](https://cocoapods.org/pods/DevKit)
[![License](https://img.shields.io/cocoapods/l/DevKit.svg?style=flat)](https://cocoapods.org/pods/DevKit)
[![Platform](https://img.shields.io/cocoapods/p/DevKit.svg?style=flat)](https://cocoapods.org/pods/DevKit)

Collection of commonly used swift code

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

DevKit is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'DevKit'
```

## DevKit Subspecs

* [Protocols]()
* [Extensions]()

## Contributing to DevKit

Adding new classes to DevKit should be added to the appropriate subspec section. Unique subspecs should include the source files, any limiting deployment targets and necessary dependencies. 

```
  # CalendarPermissionsValidator
  s.subspec 'CalendarPermissionsValidator' do |sp|
    sp.ios.deployment_target = '11.0'
    sp.dependency 'DevKit/Extensions/StringExtension'
    sp.dependency 'DevKit/Extensions/UIAlertControllerExtension'
    sp.dependency 'DevKit/Extensions/UIApplicationExtension'
    sp.source_files = 'DevKit/DevKit/Classes/Utility/Validators/CalendarPermissionsValidator/*'
  end
```

All new additions should be code reviewed before merging into master.

## License

![prolific](https://s3.amazonaws.com/prolificsitestaging/logos/Prolific_Logo_Full_Color.png)

Copyright (c) 2017 Prolific Interactive

DevKit is maintained and sponsored by Prolific Interactive. It may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: ./LICENSE
