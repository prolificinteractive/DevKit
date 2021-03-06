//
//  ErrorResponse.swift
//  TheWing
//
//  Created by Ruchi Jain on 7/25/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

public struct ErrorResponse: Codable {
    public let error: APIError?
    public let status: String?
    public let response: String?
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try? container.decode(String.self, forKey: .status)
        response = try? container.decode(String.self, forKey: .response)
        
        if let error = try? APIError(from: decoder) {
            self.error = error
        } else if let response = response {
            error = APIError(code: 0, message: response)
        } else {
            error = nil
        }
    }

}
