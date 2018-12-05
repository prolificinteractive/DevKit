//
//  UINavigationControllerExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/21/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Marker
import UIKit

extension UINavigationController {

    /// Sets the navigation bar to be transparent.
    ///
    /// - Parameter barStyle: Bar style to set.
    public func transparentNavigationBar(barStyle: UIBarStyle = .default) {
        removeNavigationBarBorder()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
        navigationBar.barStyle = barStyle
    }
    
    /// Sets the navigation bar
    ///
    /// - Parameters:
    ///   - backgroundColor: Background color.
    ///   - tintColor: Navigation items tint color.
    ///   - textStyle: Text style for title.
    public func setNavigationBar(backgroundColor: UIColor? = nil, tintColor: UIColor? = nil, textStyle: TextStyle? = nil) {
        navigationBar.titleTextAttributes = textStyle?.attributes
        navigationBar.tintColor = tintColor
        
        if backgroundColor == .clear {
            transparentNavigationBar()
        } else {
            navigationBar.isTranslucent = backgroundColor != nil ? false : true
            navigationBar.barTintColor = backgroundColor
            view.backgroundColor = backgroundColor
        }
    }
    
    /// Removes the navigation bar border
    public func removeNavigationBarBorder() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
    
    /// Adds a drop shadow to navigation bar.
    ///
    /// - Parameters:
    ///   - color: Drop shadow color. Defaults to black.
    ///   - offset: Shadow offset.
    ///   - radius: Shadow radius.
    ///   - opacity: Shadow opacity.
    public func addDropShadow(color: UIColor = .clear, offset: CGSize = .zero, radius: CGFloat = 0, opacity: Float = 0) {
        navigationBar.layer.shadowColor = color.cgColor
        navigationBar.layer.shadowOffset = offset
        navigationBar.layer.shadowRadius = radius
        navigationBar.layer.shadowOpacity = opacity
    }
    
}
