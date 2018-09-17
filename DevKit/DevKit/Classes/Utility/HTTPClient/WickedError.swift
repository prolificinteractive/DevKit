//
//  WickedError.swift
//  TheWing
//
//  Created by Paul Jones on 8/13/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

final class WickedError: NSObject, LocalizedError {
    
    // MARK: - Public Properties
    
    var reason: String? = ""
    
    override var description: String {
        return reason ?? "ErrorLocalization.networkErrorBodyText"
    }
    
    var errorDescription: String? {
        return description
    }
    
    // MARK: - Initialization
    
    init(reason: String?) {
        self.reason = reason
    }

}
