//
//  UIFontExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/9/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIFont {

    /// Returns a font with the provided parameters.
    ///
    /// - Parameters:
    ///   - name: Name of the font.
    ///   - fontSize: Size of the font.
    /// - Returns: UIFont of the name and size provided and defaults to system font if font it not found.
    public static func font(name: String, fontSize: CGFloat) -> UIFont {
        guard let font = UIFont(name: name, size: fontSize) else {
            assert(false, "Can't find font \(name)")
            return UIFont.systemFont(ofSize: fontSize)
        }
        return font
    }

}
