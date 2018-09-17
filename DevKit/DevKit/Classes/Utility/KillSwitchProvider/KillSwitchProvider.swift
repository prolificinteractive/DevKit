//
//  KillSwitchProvider.swift
//  DevKit
//
//  Created by Jonathan Samudio on 9/17/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import UIKit
import Bellerophon

class BaseKillSwitchView: UIView {

    /// Sets the user message with the given parameter.
    ///
    /// - Parameter message: Message to display to the user.
    func setUserMessage(_ message: String) {
        // Override in sub-class
    }

}

final class KillSwitchProvider {

    // MARK: - Private Properties

    private let window: UIWindow

    private let killSwitchView: BaseKillSwitchView

    private let forceUpdateView: BaseKillSwitchView

    private let networkRetryInterval: TimeInterval

    private let killSwitchErrorCode: Int

    private let forceUpgradeErrorCode: Int

    private var error: APIError?

    private var backendError: BackendError? {

    // MARK: - Public Properties
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

    init(window: UIWindow,
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
    func receivedError(_ error: APIError?) {
        self.error = error
        manager.checkAppStatus()
    }

}

// MARK: - BellerophonManagerDelegate
extension KillSwitchProvider: BellerophonManagerDelegate {

    func bellerophonStatus(_ manager: BellerophonManager, completion: @escaping (BellerophonObservable?, Error?) -> Void) {
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

    func apiInactive() -> Bool {
        return backendError?.code == killSwitchErrorCode
    }

    func forceUpdate() -> Bool {
        return backendError?.code == forceUpgradeErrorCode
    }

    func retryInterval() -> TimeInterval {
        return networkRetryInterval
    }

    func userMessage() -> String {
        guard let backendError = backendError else {
            return descriptionText
        }
        return backendError.message.isEmpty ? descriptionText : backendError.message
    }

    func setUserMessage(_ message: String) {
        // Optional Function.
    }

}
