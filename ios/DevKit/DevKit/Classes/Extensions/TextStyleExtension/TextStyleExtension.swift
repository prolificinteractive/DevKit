//
//  TextStyleExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/9/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Marker

/// Collection of all TextStyle Extensions.
///
/// **Subspec: Extensions/TextStyleExtension**
///
extension TextStyle {

    /// Return a TextStyle that's identical to the called except the color set to the given UIColor.
    ///
    /// - Parameter color: The color that's applied to the TextStyle.
    /// - Returns: TextStyle that has custom color being applied.
    func withColor(_ color: UIColor) -> TextStyle {
        var textStyle = self
        textStyle.textColor = color
        return textStyle
    }

    /// Return a TextStyle that's identical to the called except the text allignment is set to the given allignment.
    ///
    /// - Parameter allignment: NSTextAlignment.
    /// - Returns: Updated text style.
    func withAlignment(_ allignment: NSTextAlignment) -> TextStyle {
        var textStyle = self
        textStyle.textAlignment = allignment
        return textStyle
    }
    
    /// Return a TextStyle that's identical to the called except the text line spacing is set to the given line spacing.
    ///
    /// - Parameter lineSpacing: CGFloat.
    /// - Returns: TextStyle.
    func withLineSpacing(_ lineSpacing: CGFloat) -> TextStyle {
        var textStyle = self
        textStyle.lineSpacing = lineSpacing
        return textStyle
    }
    
    /// Returns textstyle with its em font as default font.
    ///
    /// - Returns: Textstyle with em font selected.
    func withEmFont() -> TextStyle {
        var textStyle = self
        textStyle.font = textStyle.emFont
        return textStyle
    }

    /// Returns textstyle with its strong font as default font.
    ///
    /// - Returns: Textstyle with strong font selected.
    func withStrongFont() -> TextStyle {
        var textStyle = self
        textStyle.font = textStyle.strongFont
        return textStyle
    }
    
    /// This attempts to build a regular font verson of this font by getting the family name.
    ///
    /// - Returns: The font you've built but with a regular typeface.
    func withRegularFont() -> TextStyle {
        var textStyle = self
        if let font = UIFont(name: textStyle.font.familyName, size: textStyle.font.pointSize) {
            textStyle.font = font
        }
        return textStyle
    }

    /// Returns new text style given a minimum line height.
    ///
    /// - Parameter minimumLineHeight: Minimum line height.
    func withMinLineHeight(_ minimumLineHeight: CGFloat) -> TextStyle {
        var textStyle = self
        textStyle.minimumLineHeight = minimumLineHeight
        return textStyle
    }

    /// Returns new text style given value for character spacing.
    ///
    /// - Parameter spacing: character spacing.
    func withCharacterSpacing(_ spacing: CGFloat) -> TextStyle {
        var textStyle = self
        textStyle.characterSpacing = spacing
        return textStyle
    }
    
    /// Returns new text style given a line break mode.
    ///
    /// - Parameter lineBreakMode: Line break mode.
    /// - Returns: TextStyle.
    func withLineBreakMode(_ lineBreakMode: LineBreakMode) -> TextStyle {
        var textStyle = self
        textStyle.lineBreakMode = lineBreakMode
        return textStyle
    }
  
}
