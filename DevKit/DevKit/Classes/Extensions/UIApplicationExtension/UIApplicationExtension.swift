//
//  UIApplicationExtension.swift
//  TheWing
//
//  Created by Luna An on 4/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// Collection of all UIApplication Extensions.
///
/// **Subspec: Extensions/UIApplicationExtension**
///
extension UIApplication {
    
    /// Opens user's settings.
    public func openSettings() {
        if let url = URL(string: UIApplicationOpenSettingsURLString) {
            open(url, options: [:], completionHandler: nil)
        }
    }

    /// The safe area insets of the application.
    ///
    /// - Returns: Edge insets of the application.
    public func safeAreaInsets() -> UIEdgeInsets {
        guard let rootView = keyWindow else {
            return UIEdgeInsets.zero
        }
        return rootView.safeAreaInsets
    }
    
}
