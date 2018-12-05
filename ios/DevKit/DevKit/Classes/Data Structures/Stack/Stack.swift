//
//  Stack.swift
//  DevKit
//
//  Created by Thibault Klein on 8/31/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// Stack.
/// A stack is a collection of elements following a First-In-Last-Out (FILO) order.
///
/// - Note:
/// Use a Stack if you need a sequence ordered as FILO.
open class Stack<T> {

    // MARK: - Public Properties

    /// `true` if the stack is empty. `false` if not.
    public var isEmpty: Bool {
        return peek() == nil
    }

    // MARK: - Private Properties

    private var storage: [T] = []

    // MARK: - Initialization

    public init() { }

    // MARK: - Public Functions

    // MARK: General Functions

    /// Returns the value at the top of the stack.
    ///
    /// - Complexity: O(1)
    /// - Returns: The value at the top of the stack.
    public func peek() -> T? {
        return storage.last
    }

    // MARK: Adding Functions

    /// Adds a value to the top of the stack.
    ///
    /// - Complexity: O(1)
    /// - Parameter value: The value to add.
    public func push(_ value: T) {
        storage.append(value)
    }

    // MARK: Removing Functions

    /// Returns the value at the top of the stack and removes it from it.
    ///
    /// - Complexity: O(1)
    /// - Returns: The value at the top of the stack.
    public func pop() -> T? {
        return storage.popLast()
    }

}
