//
//  KeyboardObserver.swift
//  TheWing
//
//  Created by Luna An on 3/21/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import UIKit

/// **Subspec: Utility/KeyboardObserver**
///
/// ```
/// override func viewDidLoad() {
///     super.viewDidLoad()
///     addRecognizerForKeyboardDismissal()
/// }
/// ```
///
/// To hide the keyboard when the user taps on the view add the `addRecognizerForKeyboardDismissal` to the viewDidLoad function.
///
/// ```
/// override func viewWillAppear(_ animated: Bool) {
///     super.viewWillAppear(animated)
///     addKeyboardObservers()
/// }
///
/// override func viewWillDisappear(_ animated: Bool) {
///     super.viewWillDisappear(animated)
///     removeKeyboardObservers()
/// }
/// ```
///
/// Add the keyboard observer functions to `viewWillAppear` and `viewWillDisappear` respectively. Adding them will allow the view controller to call the functions below when the keyboard is shown or hidden.
///
/// ```
/// override func keyboardWillShow(notification: Notification) {
///     // Handle keyboard will show action
/// }
///
/// override func keyboardWillHide(notification: Notification) {
///     // Handle keyboard will hide action
/// }
/// ```
///
/// The functions above will be called when the keyboard is shown or hidden.
public protocol KeyboardObserver {
    
    /// Adds keyboard observers to element.
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
    @objc public func dismissKeyboard() {
        view.endEditing(true)
    }

    /// Handler for keyboard will show.
    ///
    /// - Parameter notification: Keyboard will show notification.
    @objc public func keyboardWillShow(notification: Notification) {
        // Will be overridden
    }

    /// Handler for keyboard will hide.
    ///
    /// - Parameter notification: Keyboard will hide notification.
    @objc public func keyboardWillHide(notification: Notification) {
        // Will be overridden
    }

    /// Hides keyboard if tapped outside responder.
    public func addRecognizerForKeyboardDismissal() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    public func addKeyboardObservers() {
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

    public func removeKeyboardObservers() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIApplicationWillResignActive, object: nil)
    }

}
