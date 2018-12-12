//
//  KillSwitchProviderProtocol.swift
//  DevKit
//
//  Created by Jonathan Samudio on 9/17/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

public protocol KillSwitchProviderProtocol {

    /// Called when a network error is received.
    ///
    /// - Parameter error: Api error.
    func receivedError(_ error: APIErrorType?)

}
