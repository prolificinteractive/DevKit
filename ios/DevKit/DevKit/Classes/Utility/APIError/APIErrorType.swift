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
/// **Subspec: Utility/APIError**
///
/// ```
/// func decodeData<T: Decodable>(_ data: Data?) -> Result<T> {
///     guard let data = data else {
///         return Result.failure(APIErrorType.noDataRetreived)
///     }
///
///     do {
///         let model = try decoder.decode(T.self, from: data)
///         return Result.success(model)
///     } catch {
///         return decodeError(data, decodeError: error)
///     }
/// }
/// ```
///
/// When decoding the objects from an API errors can be identified with the APIErrorType. In the example above the
/// APIErrorType is used to identify when no data is returned from the API. The other options allows for identifying failed
/// deserializations and custom error codes through the APIError model.
///
/// - backend: Custom error message from backend.
/// - noDataRetreived: Used when the data is nil from the api.
/// - deserializationFailed: Used when the data can't be deserialized into the desired model.
public enum APIErrorType: Error {
    case backend(error: APIError)
    case noDataRetreived
    case deserializationFailed
    
    /// Indicates if the error is recieved from the backend.
    public var isBackendError: Bool {
        switch self {
        case .backend:
            return true
        default:
            return false
        }
    }
    
    /// Localized description.
    public var localizedDescription: String {
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
