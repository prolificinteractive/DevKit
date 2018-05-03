//
//  UIBarButtonExtension.swift
//  TheWing
//
//  Created by Ruchi Jain on 3/28/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Marker
import UIKit

extension UIBarButtonItem {
    
    /// Sets the text style of the item for a given control state.
    ///
    /// - Parameters:
    ///   - textStyle: Text style.
    ///   - controlState: Control state.
    func setTitleTextStyle(with textStyle: TextStyle, for controlState: UIControlState) {
        let textAttributes = textStyle.attributes
        setTitleTextAttributes(textAttributes, for: controlState)
    }
    
}
