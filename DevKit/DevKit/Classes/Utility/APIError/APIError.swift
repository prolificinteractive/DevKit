//
//  APIError.swift
//  TheWing
//
//  Created by Ruchi Jain on 7/25/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

/// Custom network API error model.
///
/// **Subspec: Utility/APIError**
///
/// ```
/// APIError(code: 0, message: "Something went wrong!")
/// ```
///
/// The APIError is a model that represents a network error that comes from an API response.
///
public struct APIError: Codable {

    /// Network error code.
    public let code: Int

    /// Message of the network error.
    public let message: String

    /// Default initializer for the model.
    ///
    /// - Parameters:
    ///   - code: Network error code.
    ///   - message: Message of the network error.
    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
}
