//
//  DataDecoder.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/7/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import Alamofire

final class DataDecoder {

	// MARK: - Private Properties

    private let decoder: JSONDecoder

    private let killSwitchProvider: KillSwitchProvider?

	// MARK: - Initialization

    init(decoder: JSONDecoder = JSONDecoder(), killSwitchProvider: KillSwitchProvider? = nil) {
        self.decoder = decoder
        self.killSwitchProvider = killSwitchProvider
    }

	// MARK: - Public Functions

    /// Decodes the data into the desired result.
    ///
    /// - Parameter data: Data to deserialize.
    /// - Returns: Desired result with the deserialized object.
    func decodeData<T: Decodable>(_ data: Data?) -> Result<T> {
        guard let data = data else {
            return Result.failure(APIErrorType.noDataRetreived)
        }

        do {
            let model = try decoder.decode(T.self, from: data)
            return Result.success(model)
        } catch {
            return decodeError(data, decodeError: error)
        }
    }

}

// MARK: - Private Functions
private extension DataDecoder {

    func decodeError<T: Decodable>(_ data: Data, decodeError: Error) -> Result<T> {
        do {
            let error = try decoder.decode(ErrorResponse.self, from: data)
            if let error = error.error {
                let apiError = APIErrorType.backend(error: error)
                killSwitchProvider?.receivedError(apiError)
                return Result.failure(apiError)
            } else {
                #if DEBUG
                print("Deserialization Failed: ")
                print(decodeError)
                print(error)
                #endif
                return Result.failure(WickedError(reason: error.response))
            }
        } catch {
            #if DEBUG
            print("Deserialization Failed: ")
            print(decodeError)
            print(error)
            #endif
            return Result.failure(APIErrorType.deserializationFailed)
        }
    }

}
