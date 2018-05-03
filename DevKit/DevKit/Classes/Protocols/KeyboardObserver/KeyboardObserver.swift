//
//  KeyboardObserver.swift
//  TheWing
//
//  Created by Luna An on 3/21/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

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

// MARK: - KeyboardObserver
extension UIViewController: KeyboardObserver {

    /// Dismiss keyboard action.
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    /// Handler for keyboard will show.
    ///
    /// - Parameter notification: Keyboard will show notification.
    @objc func keyboardWillShow(notification: Notification) {
        // Will be overridden
    }

    /// Handler for keyboard will hide.
    ///
    /// - Parameter notification: Keyboard will hide notification.
    @objc func keyboardWillHide(notification: Notification) {
        // Will be overridden
    }

    /// Hides keyboard if tapped outside responder.
    func addRecognizerForKeyboardDismissal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    func addKeyboardObservers() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: .UIKeyboardWillShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: .UIKeyboardWillHide,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(dismissKeyboard),
                                               name: .UIApplicationWillResignActive,
                                               object: nil)
    }

    func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIApplicationWillResignActive, object: nil)
    }

}
