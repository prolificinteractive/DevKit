//
//  HTTPRequest.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/7/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Alamofire

public typealias Headers = [String: String]

/// HTTP request.
public struct HTTPRequest {

	// MARK: - Public Properties

    /// HTTP method.
    public let method: HTTPMethod

    /// HTTP request base URL.
    public let baseURL: URL

    /// HTTP request path.
    public let path: String

    /// HTTP Query items.
    public let queryItems: [URLQueryItem]?

    /// HTTP request parameters.
    public let parameters: Parameters?

    /// HTTP request headers.
    public let headers: Headers?

	// MARK: - Initialization

    /// Initializes a HTTP request.
    ///
    /// - Parameters:
    ///   - method: The HTTP method to use.
    ///   - baseURL: The HTTP base URL to use.
    ///   - path: The HTTP path to use.
    ///   - query: The HTTP query items to use.
    ///   - parameters: The HTTP parameters to use.
    ///   - headers: The HTTP headers to use.
    public init(method: HTTPMethod,
         baseURL: URL,
         path: String,
         queryItems: [URLQueryItem]?,
         parameters: Parameters?,
         headers: Headers?) {

        self.method = method
        self.baseURL = baseURL
        self.path = path
        self.queryItems = queryItems
        self.parameters = parameters
        self.headers = headers
    }
    
}

extension HTTPRequest {

    /// HTTP endpoint. Combines the base URL and the path to be used for a HTTP call.
    public var endpoint: URLRequest {
        guard var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: false) else {
            return URLRequest(url: baseURL.appendingPathComponent(path))
        }

        components.path.append(path)
        
        if let queryItems = queryItems, !queryItems.isEmpty {
            components.queryItems = queryItems
        }

        let url = components.url ?? baseURL.appendingPathComponent(path)
        return request(url: url)
    }

}

// MARK: - Private Functions
private extension HTTPRequest {

    func request(url: URL) -> URLRequest {
        var request = URLRequest(url: url)

        if let parameters = parameters {
            request.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: .sortedKeys)
        }

        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        return request
    }

}
