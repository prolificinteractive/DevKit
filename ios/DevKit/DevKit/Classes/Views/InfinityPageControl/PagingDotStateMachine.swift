//
//  PagingDotStateMachine.swift
//  TheWing
//
//  Created by Prolific Interactive on 4/27/17.
//  Copyright © 2017 Prolific Interactive. All rights reserved.
//

/// Paging dot state change.
///
/// - noChange: No change.
/// - shrink: Shrink.
/// - expand: Expand.
enum PagingDotStateMachine {
    case noChange
    case shrink
    case expand
    
    /// State.
    ///
    /// - Parameters:
    ///   - index: Index.
    ///   - selectedIndex: Selected index.
    ///   - direction: Direction (left/right/none).
    ///   - numberOfPages: Number of pages.
    /// - Returns: Paging dot state change.
    static func state(for index: Int,
                      selectedIndex: Int,
                      direction: PageControlDirection,
                      numberOfPages: Int) -> PagingDotStateMachine {
        guard numberOfPages >= InfinityPageControl.dotLimit else {
            return .noChange
        }
        
        if direction == .right {
            return stateMoveRight(for: index, selectedIndex: selectedIndex)
        } else if direction == .left {
            return stateMoveLeft(for: index, selectedIndex: selectedIndex)
        }
        
        return .noChange
    }
    
    static private func stateMoveRight(for index: Int, selectedIndex: Int) -> PagingDotStateMachine {
        if selectedIndex - InfinityPageControl.dotOffset >= index {
            return .shrink
        }
        
        if selectedIndex > InfinityPageControl.dotOffset
            && (index == selectedIndex || index == selectedIndex + 1 || index == selectedIndex + 2) {
            return .expand
        }
        
        return .noChange
    }
    
    static private func stateMoveLeft(for index: Int, selectedIndex: Int) -> PagingDotStateMachine {
        if index >= selectedIndex - InfinityPageControl.dotOffset && index <= selectedIndex {
            return .expand
        }
        
        if selectedIndex >= InfinityPageControl.dotOffset && index > selectedIndex {
            return .shrink
        }
        
        return .noChange
    }
    
}
