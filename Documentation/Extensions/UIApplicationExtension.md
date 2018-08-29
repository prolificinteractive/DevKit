# UIApplication Extension

**Subspec: Extensions/UIApplicationExtension**

*Deployment Target: iOS 11.0*

```swift
/// Opens user's settings.
public func openSettings()
```

When called, the device will deeplink to the device's settings page.

```
/// The safe area insets of the application.
///
/// - Returns: Edge insets of the application.
public func safeAreaInsets() -> UIEdgeInsets
```

Will return the safe area insets or zero if there are none.
