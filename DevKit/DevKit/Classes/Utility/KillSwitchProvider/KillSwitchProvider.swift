//
//  KillSwitchProvider.swift
//  DevKit
//
//  Created by Jonathan Samudio on 9/17/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import UIKit
import Bellerophon

open class KillSwitchProvider: KillSwitchProviderProtocol {

    // MARK: - Private Properties

    private let window: UIWindow

    private let killSwitchView: BaseKillSwitchView

    private let forceUpdateView: BaseKillSwitchView

    private let networkRetryInterval: TimeInterval

    private let killSwitchErrorCode: Int

    private let forceUpgradeErrorCode: Int

    private var error: APIErrorType?

    private var backendError: APIError? {
        guard let error = error else {
            return nil
        }

        switch error {
        case .backend(let error):
            return error
        default:
            return nil
        }
    }

    private var descriptionText: String {
        if apiInactive() {
            return "KillSwitchLocalization.killSwitchDescriptionText"
        } else if forceUpdate() {
            return "KillSwitchLocalization.forceUpdateDescriptionText"
        }
        return ""
    }

    private lazy var manager: BellerophonManager = {
        let config = BellerophonConfig(window: window,
                                       killSwitchView: killSwitchView,
                                       forceUpdateView: forceUpdateView,
                                       delegate: self)
        return BellerophonManager(config: config)
    }()

    // MARK: - Initialization

    public init(window: UIWindow,
                killSwitchView: BaseKillSwitchView,
                forceUpdateView: BaseKillSwitchView,
                killSwitchErrorCode: Int,
                forceUpgradeErrorCode: Int,
                retryInterval: TimeInterval = 15) {
        self.window = window
        self.killSwitchView = killSwitchView
        self.forceUpdateView = forceUpdateView
        self.killSwitchErrorCode = killSwitchErrorCode
        self.forceUpgradeErrorCode = forceUpgradeErrorCode
        networkRetryInterval = retryInterval
    }

    // MARK: - Public Functions

    /// Called when a network error is received.
    ///
    /// - Parameter error: Api error.
    public func receivedError(_ error: APIErrorType?) {
        self.error = error
        manager.checkAppStatus()
    }

}

// MARK: - BellerophonManagerDelegate
extension KillSwitchProvider: BellerophonManagerDelegate {

    /// Provide Bellerophon's current status according to the status object received.
    ///
    /// - Parameters:
    ///   - manager: The Bellerophon manager.
    ///   - completion: Completion block that returns the BellerophonObservable status.
    public func bellerophonStatus(_ manager: BellerophonManager, completion: @escaping (BellerophonObservable?, Error?) -> Void) {
        if apiInactive() {
            killSwitchView.setUserMessage(userMessage())
        } else if forceUpdate() {
            forceUpdateView.setUserMessage(userMessage())
        }
        completion(self, nil)
    }

}

// MARK: - BellerophonObservable
extension KillSwitchProvider: BellerophonObservable {

    /// Called to determine if the killswitch is activated.
    ///
    /// - Returns: Flag if the killswitch is activated.
    public func apiInactive() -> Bool {
        return backendError?.code == killSwitchErrorCode
    }

    /// Called to determine if the force update is activated.
    ///
    /// - Returns: Flag if the force update is activated.
    public func forceUpdate() -> Bool {
        return backendError?.code == forceUpgradeErrorCode
    }

    /// The network retry interval before re-checking the app status.
    ///
    /// - Returns: Time interval for re-checking the app status.
    public func retryInterval() -> TimeInterval {
        return networkRetryInterval
    }

    /// User message to display on the custom view.
    ///
    /// - Returns: User message string to display.
    public func userMessage() -> String {
        guard let backendError = backendError else {
            return descriptionText
        }
        return backendError.message.isEmpty ? descriptionText : backendError.message
    }

    /// Optional deprecated function to set the user's message.
    ///
    /// - Parameter message: Message string.
    public func setUserMessage(_ message: String) {
        // Optional Function.
    }

}
