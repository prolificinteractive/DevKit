//
//  APIError.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/7/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import Bellerophon

/// Enum for the possible API errors.
///
/// - backend: Custom error message from backend.
/// - noDataRetreived: Used when the data is nil from the api.
/// - deserializationFailed: Used when the data can't be deserialized into the desired model.
public enum APIErrorType: Error {
    case backend(error: APIError)
    case noDataRetreived
    case deserializationFailed
    
    /// Indicates if the error is recieved from the backend.
    var isBackendError: Bool {
        switch self {
        case .backend:
            return true
        default:
            return false
        }
    }
    
    /// Localized description.
    var localizedDescription: String {
        switch self {
        case .backend(let error):
            return "Error \(error.code): \(error.message)"
        case .noDataRetreived:
            return "No Data Retrieved"
        case .deserializationFailed:
            return "Deserialization Failed"
        }
    }

}
