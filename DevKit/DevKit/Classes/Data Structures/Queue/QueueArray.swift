//
//  QueueArray.swift
//  DevKit
//
//  Created by Thibault Klein on 9/6/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// QueueArray.
/// A queue is a collection of elements following a First-In-First-Out (FIFO) order.
/// This implementation uses an array to store the elements.
///
/// - Note:
/// Use a Queue if you need a sequence ordered as FIFO.
///
/// - The advantage of using an array is its simplicity and relative low memory impact.
/// - The disadvantage is a O(n) complexity every time an element gets dequeued.
/// Very large queues will have a bad performance using QueueArray.
open class QueueArray<T>: Queueable {
    public typealias Element = T

    // MARK: - Public Properties

    /// `true` if the stack is empty. `false` if not.
    public var isEmpty: Bool {
        return peek() == nil
    }

    // MARK: - Private Properties

    private var storage: [Element] = []

    // MARK: - Initialization

    public init() { }

    // MARK: - Public Functions
    // MARK: General Functions

    /// Returns the value at the end of the queue.
    ///
    /// - Complexity: O(1)
    /// - Returns: The value at the end of the queue.
    public func peek() -> Element? {
        return storage.last
    }

    // MARK: Adding Functions

    /// Enqueues an element at the beginning of the queue.
    ///
    /// - Complexity: O(1)
    /// - Parameter value: The value to enqueue.
    public func enqueue(_ value: Element) {
        storage.append(value)
    }

    // MARK: Removing Functions

    /// Dequeues the element at the end of the queue.
    ///
    /// - Complexity: O(n)
    /// - Returns: The dequeued element.
    public func dequeue() -> Element? {
        return isEmpty ? nil : storage.removeFirst()
    }

}
