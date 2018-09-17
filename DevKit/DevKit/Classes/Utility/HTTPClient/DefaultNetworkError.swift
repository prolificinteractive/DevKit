//
//  DefaultNetworkError.swift
//  TheWing
//
//  Created by Paul Jones on 8/13/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

open class DefaultNetworkError: NSObject, LocalizedError {
    
    // MARK: - Public Properties
    
    public var reason: String? = ""

    open override var description: String {
        return reason ?? ""
    }
    
    public var errorDescription: String? {
        return description
    }
    
    // MARK: - Initialization
    
    public init(reason: String?) {
        self.reason = reason
    }

}
