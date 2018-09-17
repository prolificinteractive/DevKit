//
//  ErrorResponse.swift
//  TheWing
//
//  Created by Ruchi Jain on 7/25/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

struct ErrorResponse: Codable {
    let error: BackendError?
    let status: String?
    let response: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        status = try? container.decode(String.self, forKey: .status)
        response = try? container.decode(String.self, forKey: .response)
        
        if let error = try? BackendError(from: decoder) {
            self.error = error
        } else if let response = response {
            error = BackendError(code: 0, message: response)
        } else {
            error = nil
        }
    }

}
