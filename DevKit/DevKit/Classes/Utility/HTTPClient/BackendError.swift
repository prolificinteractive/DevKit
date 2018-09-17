//
//  BackendError.swift
//  TheWing
//
//  Created by Ruchi Jain on 7/25/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

struct BackendError: Codable {
    let code: Int
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case code = "code"
        case message = "message"
    }
    
}
