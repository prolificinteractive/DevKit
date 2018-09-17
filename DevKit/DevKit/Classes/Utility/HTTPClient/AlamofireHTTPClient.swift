//
//  AlamofireHTTPClient.swift
//  TheWing
//
//  Created by Ruchi Jain on 3/2/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Alamofire

/// Alamofire HTTP client that makes network requests to the api.
final class AlamofireHTTPClient: HTTPClient {

	// MARK: - Private Properties

    private let decoder: DataDecoder

    // MARK: - Initialization

    init(decoder: DataDecoder) {
        self.decoder = decoder
    }

	// MARK: - Public Functions

    /// Performs a network call with the given parameters.
    ///
    /// - Parameters:
    ///   - request: HTTP request to load data.
    ///   - completion: Result handler used when the network call is completed.
    func perform<T: Decodable>(request: HTTPRequest, completion: @escaping (_ result: Result<T>) -> Void) {
        Alamofire.request(request.endpoint).responseJSON { (response) in
            completion(self.decoder.decodeData(response.data))
        }
    }

}
