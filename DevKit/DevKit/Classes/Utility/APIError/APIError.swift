//
//  APIError.swift
//  TheWing
//
//  Created by Ruchi Jain on 7/25/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

public struct APIError: Codable {
    public let code: Int
    public let message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }

    public init(code: Int, message: String) {
        self.code = code
        self.message = message
    }
    
}
