//
//  PageControlDirection.swift
//  TheWing
//
//  Created by Prolific Interactive on 4/27/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/// Enumerates possible directions the page control can move.
///
/// - left: Left move.
/// - right: Right move.
/// - none: No move.
enum PageControlDirection {
    case left
    case right
    case none
    
    /// Move.
    ///
    /// - Parameters:
    ///   - previousPage: Previous page.
    ///   - currentPage: Current page.
    /// - Returns: PageControlDirection.
    static func direction(previousPage: Int, currentPage: Int) -> PageControlDirection {
        if previousPage == currentPage {
            return .none
        }
        
        return previousPage > currentPage ? .left : .right
    }
    
}
