//
//  BaseKillSwitchView.swift
//  DevKit
//
//  Created by Jonathan Samudio on 9/17/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import UIKit

/// The BaseKillSwitchView used to be subclassed to add functionality to the UIView.
///
/// **Subspec: Utility/KillSwitchProvider**
///
/// ```
/// final class KillSwitchView: BaseKillSwitchView {
///
///     private let descriptionLabel = UILabel()
///
///     override func setUserMessage(_ message: String) {
///         descriptionLabel.setText(message, using: theme.textStyleTheme.bodyNormal.withAlignment(.center))
///     }
///
/// }
/// ```
///
/// The BaseKillSwitchView is a simple class that combines a view with the setUserMessage functionality. The setUserMessage
/// class should be overrided in the subclass.
///
open class BaseKillSwitchView: UIView {

    // MARK: - Public Functions

    /// Sets the user message with the given parameter.
    ///
    /// - Parameter message: Custom message to display to the user.
    open func setUserMessage(_ message: String) {
        // Override in sub-class
    }

}
