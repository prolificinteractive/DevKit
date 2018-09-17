//
//  HTTPClient.swift
//  TheWing
//
//  Created by Jonathan Samudio on 5/16/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import Alamofire

protocol HTTPClient {
    
    /// Performs a network call with the given parameters.
    ///
    /// - Parameters:
    ///   - request: HTTP request to load data.
    ///   - completion: Result handler used when the network call is completed.
    func perform<T: Decodable>(request: HTTPRequest, completion: @escaping (_ result: Result<T>) -> Void)

}
