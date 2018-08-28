//
//  UIColorExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/7/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    /// Returns an image of the color.
    public var image: UIImage {
        let size = CGSize(width: 1, height: 1)
        let rect = CGRect(origin: .zero, size: size)

        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        self.setFill()
        UIRectFill(rect)

        guard let image: UIImage = UIGraphicsGetImageFromCurrentImageContext() else {
            return UIImage()
        }

        UIGraphicsEndImageContext()
        return image
    }

    /// Initialize and return a UIColor object that corresponds to the given hex string
    ///
    /// - Parameter hexString: 6 digits color hex string
    public convenience init(hexString: String) {
        assert(hexString.hasPrefix("#"), "Hex color string should start with \"#\"")

        let hexColor = hexString.replacingOccurrences(of: "#", with: "")
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt32 = 0

        assert(hexColor.count == 6, "Hex color string should be 6 digits long")
        scanner.scanHexInt32(&hexNumber)
        let red = CGFloat((hexNumber & 0xff0000) >> 16) / 255
        let green = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
        let blue = CGFloat(hexNumber & 0x0000ff) / 255

        self.init(red: red, green: green, blue: blue, alpha: 1)
    }

    /// Darkens the receiver color by blending it with black color using given weight.
    ///
    /// - Parameter weight: Proportional weight that should be given to blend color, specified as value from 0.0 to 1.0.
    /// - Returns: Darkened color.
    public func darken(by weight: CGFloat) -> UIColor {
        return blend(with: .black, weight: weight)
    }

    /// Brightens the receiver color by blending it with white color using given weight.
    ///
    /// - Parameter weight: Proportional weight that should be given to blend color, specified as value from 0.0 to 1.0.
    /// - Returns: Brightened color.
    public func brighten(by weight: CGFloat) -> UIColor {
        return blend(with: .white, weight: weight)
    }

    /// Fades the current color to the target color.
    ///
    /// - Parameters:
    ///   - targetColor: Target color to transition to.
    ///   - percent: Percent of the fade.
    /// - Returns: The faded color.
    public func fadeColor(targetColor: UIColor, percent: CGFloat) -> UIColor {
        let initialCI = CIColor(color: self)
        let targetCI = CIColor(color: targetColor)

        let resultRed = initialCI.red + percent * (targetCI.red - initialCI.red)
        let resultGreen = initialCI.green + percent * (targetCI.green - initialCI.green)
        let resultBlue = initialCI.blue + percent * (targetCI.blue - initialCI.blue)

        return UIColor(red: resultRed, green: resultGreen, blue: resultBlue, alpha: 1)
    }

    /// Blend the receiver with specified color using given weight.
    ///
    /// - Parameters:
    ///   - blendColor: Color to blend with.
    ///   - weight: Proportional weight that should be given to blend color, specified as value from 0.0 to 1.0.
    /// - Returns: Blended color.
    public func blend(with blendColor: UIColor, weight: CGFloat) -> UIColor {
        var rgbaValues = Array(repeating: CGFloat(0.0), count: 4)
        var blendRgbaValues = Array(repeating: CGFloat(0.0), count: 4)

        var red = rgbaValues[0]
        var green = rgbaValues[1]
        var blue = rgbaValues[2]
        var alpha = rgbaValues[3]

        var blendRed = blendRgbaValues[0]
        var blendGreen = blendRgbaValues[1]
        var blendBlue = blendRgbaValues[2]
        var blendAlpha = blendRgbaValues[3]

        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        blendColor.getRed(&blendRed, green: &blendGreen, blue: &blendBlue, alpha: &blendAlpha)

        let invertWeight = 1 - weight

        return UIColor(
            red: (red * invertWeight + blendRed * weight) / 1,
            green: (green * invertWeight + blendGreen * weight) / 1,
            blue: (blue * invertWeight + blendBlue * weight) / 1,
            alpha: (alpha * invertWeight + blendAlpha * weight) / 1
        )
    }

}
