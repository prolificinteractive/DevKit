//
//  PagingDotState.swift
//  TheWing
//
//  Created by Prolific Interactive on 6/19/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/// PagingDotState
///
/// - large: Large.
/// - medium: Medium.
/// - small: Small.
/// - hidden: Hidden.
enum PagingDotState {
    case large
    case medium
    case small
    case hidden
    
    /// All states.
    static var states: [PagingDotState] {
        return [
            .large,
            .medium,
            .small,
            .hidden
        ]
    }
    
    /// Previous state.
    ///
    /// - Returns: Previous dot state or current one if no previous state.
    func previousState() -> PagingDotState {
        if let currentIndex = PagingDotState.states.index(of: self),
            currentIndex != PagingDotState.states.startIndex {
            let previousIndex = PagingDotState.states.index(before: currentIndex)
            let newState = PagingDotState.states[previousIndex]
            return newState
        }
        
        return self
    }
    
    /// Next state.
    ///
    /// - Returns: Next dot state or current one if no next state.
    func nextState() -> PagingDotState {
        if let index = PagingDotState.states.index(of: self),
            index != PagingDotState.states.endIndex - 1 {
            let afterIndex = PagingDotState.states.index(after: index)
            let newState = PagingDotState.states[afterIndex]
            return newState
        }
        
        return self
    }
    
}
