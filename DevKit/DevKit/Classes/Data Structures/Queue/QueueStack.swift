//
//  QueueStack.swift
//  DevKit
//
//  Created by Thibault Klein on 9/6/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// QueueStack.
/// A queue is a collection of elements following a First-In-First-Out (FIFO) order.
/// This implementation uses two stacks to store the elements.
///
/// - Note:
/// Use a Queue if you need a sequence ordered as FIFO.
///
/// - The advantage of using two stack is constant complexity when enqueueing and dequeueing.
/// QueueStack has better performance when working with large queues than QueueArray.
open class QueueStack<T>: Queueable {
    public typealias Element = T

    // MARK: - Public Properties

    /// `true` if the stack is empty. `false` if not.
    public var isEmpty: Bool {
        return leftStack.isEmpty && rightStack.isEmpty
    }

    // MARK: - Private Properties

    private var leftStack: [T] = []
    private var rightStack: [T] = []

    // MARK: - Initialization

    public init() { }

    // MARK: - Public Functions
    // MARK: General Functions

    /// Returns the value at the end of the queue.
    ///
    /// - Complexity: O(1)
    /// - Returns: The value at the end of the queue.
    public func peek() -> T? {
        return !leftStack.isEmpty ? leftStack.last : rightStack.first
    }

    // MARK: Adding Functions

    /// Enqueues an element at the beginning of the queue.
    ///
    /// - Complexity: O(1)
    /// - Parameter value: The value to enqueue.
    public func enqueue(_ value: T) {
        rightStack.append(value)
    }

    // MARK: Removing Functions

    /// Dequeues the element at the end of the queue.
    ///
    /// - Complexity: O(1)
    /// - Returns: The dequeued element.
    public func dequeue() -> T? {
        if leftStack.isEmpty {
            leftStack = rightStack.reversed()
            rightStack.removeAll()
        }

        return leftStack.popLast()
    }

}
