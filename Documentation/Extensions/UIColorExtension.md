# UIColor Extension

**Subspec: Extensions/UIColorExtension**

## Image Generation

```
/// Returns an image of the color.
public var image: UIImage
```

## Initializers

```
/// Initialize and return a UIColor object that corresponds to the given hex string
///
/// - Parameter hexString: 6 digits color hex string
public convenience init(hexString: String)
```

## Blend Colors

```
/// Darkens the receiver color by blending it with black color using given weight.
///
/// - Parameter weight: Proportional weight that should be given to blend color, specified as value from 0.0 to 1.0.
/// - Returns: Darkened color.
public func darken(by weight: CGFloat) -> UIColor
```

```
/// Brightens the receiver color by blending it with white color using given weight.
///
/// - Parameter weight: Proportional weight that should be given to blend color, specified as value from 0.0 to 1.0.
/// - Returns: Brightened color.
public func brighten(by weight: CGFloat) -> UIColor
```

```
/// Fades the current color to the target color.
///
/// - Parameters:
///   - targetColor: Target color to transition to.
///   - percent: Percent of the fade.
/// - Returns: The faded color.
public func fadeColor(targetColor: UIColor, percent: CGFloat) -> UIColor
```

```
/// Blend the receiver with specified color using given weight.
///
/// - Parameters:
///   - blendColor: Color to blend with.
///   - weight: Proportional weight that should be given to blend color, specified as value from 0.0 to 1.0.
/// - Returns: Blended color.
public func blend(with blendColor: UIColor, weight: CGFloat) -> UIColor
```