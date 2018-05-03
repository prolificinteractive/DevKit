//
//  KeyboardObserver.swift
//  TheWing
//
//  Created by Luna An on 3/21/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

/// Keyboard notifications observer.
protocol KeyboardObserver {
    
    /// Adds keybaord observers to element.
    func addKeyboardObservers()
    
    /// Removes keyboard observers from element.
    func removeKeyboardObservers()
    
    /// Notifies that the keyboard will show.
    ///
    /// - Parameter notification: Notification sent when keyboard will show.
    func keyboardWillShow(notification: Notification)
    
    /// Notifies that the keyboard will hide.
    ///
    /// - Parameter notification: Notification sent when keyboard will hide.
    func keyboardWillHide(notification: Notification)
    
}
