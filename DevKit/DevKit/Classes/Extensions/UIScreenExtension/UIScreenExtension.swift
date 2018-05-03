//
//  UIScreenExtension.swift
//  TheWing
//
//  Created by Luna An on 3/19/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

extension UIScreen {
    
    /// Returns the screen width.
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    
    /// Returns the screen height.
    static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    /// Returns if the screen size is iPhone X's or bigger.
    static var isiPhoneXOrBigger: Bool {
        if #available(iOS 11.0, *) {
            if UIDevice.current.userInterfaceIdiom == .phone {
                return UIScreen.main.nativeBounds.height >= 2436
            }
        }
        return false
    }
    
    /// Returns if the detected device has a large screen equivelaent to plus models'.
    static var isiPhonePlus: Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIScreen.main.nativeBounds.height >= 1920 && UIScreen.main.nativeBounds.height < 2436
        }
        
        return false
    }
    
    /// Returns if the detected device has a large screen.
    static var isLarge: Bool {
        if UIScreen.isiPhoneXOrBigger || UIScreen.isiPhonePlus {
            return true
        }
        
        return false
    }
    
    /// Returns if the detected device has a small screen.
    static var isSmall: Bool {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return UIScreen.main.nativeBounds.height <= 1136
        }
        
        return false
    }
    
}
