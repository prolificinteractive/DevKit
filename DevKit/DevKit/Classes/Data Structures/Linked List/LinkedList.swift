//
//  LinkedList.swift
//  DevKit
//
//  Created by Thibault Klein on 8/30/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// Linked List.
/// A linked list is a linear collection of data elements where each element points to the next. A linked list has several theoretical advantages over contiguous storage options such as the Swift Array:
/// - Constant time insertion and removal from the front of the list.
/// - Reliable performance characteristics.
///
///
/// - Note:
/// Use a linked list over a Swift array if you need to store a large amount of data and you need to perform
/// insertions and removals from any position in the sequence.
///
/// Do not use a linked list if you need indexing, sorting, random access to the data or sequence traversal from the back of the sequence to the front.
///
/// - Warning: Due to the fact that each node has a reference to the next node, the memory footprint of a linked list can have a negative impact on the device if the list becomes extremely large.
open class LinkedList<T> {

    // MARK: - Public Properties
    public var head: LinkedListNode<T>?
    public var tail: LinkedListNode<T>?

    /// `true` if the linked list is empty. `false` if not.
    public var isEmpty: Bool {
        return head == nil
    }

    // MARK: - Initialization

    public init() { }

    // MARK: - General Functions

    // MARK: - Public Functions

    /// Returns the linked list head's value.
    ///
    /// - Returns: The head's value.
    public func peek() -> T? {
        return head?.value
    }

    /// Returns the node at the given index, or nil if the node can't be found.
    ///
    /// - Complexity: O(n)
    /// - Parameter index: The index to use.
    /// - Returns: The node at the given index.
    public func node(at index: Int) -> LinkedListNode<T>? {
        var currentIndex = 0
        var currentNode = head

        while let current = currentNode, currentIndex != index {
            currentNode = current.next
            currentIndex += 1
        }

        return currentNode
    }

    // MARK: Adding Functions

    /// Adds a value at the beginning of the linked list.
    ///
    /// - Complexity: O(1)
    /// - Parameter value: The value to add.
    /// - Returns: The newly added node.
    @discardableResult
    public func push(_ value: T) -> LinkedListNode<T> {
        guard !isEmpty else {
            head = LinkedListNode(value: value)
            tail = head

            return head!
        }

        let node = LinkedListNode(value: value, next: head)
        head = node

        return node
    }

    /// Appends a value at the end of the linked list.
    ///
    /// - Complexity: O(1)
    /// - Parameter value: The value to add.
    /// - Returns: The newly added node.
    @discardableResult
    public func append(_ value: T) -> LinkedListNode<T> {
        guard !isEmpty else {
            return push(value)
        }

        let node = LinkedListNode(value: value)
        tail?.next = node
        tail = node

        return node
    }

    /// Inserts a value after the given node.
    ///
    /// - Complexity: O(1)
    /// - Parameters:
    ///   - value: The value to insert.
    ///   - node: The node to add after.
    /// - Returns: The newly added node.
    @discardableResult
    public func insert(value: T, after node: LinkedListNode<T>) -> LinkedListNode<T> {
        guard tail !== node else {
            return append(value)
        }

        let newNode = LinkedListNode(value: value)
        newNode.next = node.next
        node.next = newNode

        return newNode
    }

    // MARK: Removing Functions

    /// Removes the value at the top of the list.
    ///
    /// - Complexity: O(1)
    /// - Returns: The value at top of the list.
    public func pop() -> T? {
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }

        return head?.value
    }

    /// Removes the last node of the list.
    ///
    /// - Complexity: O(n)
    /// - Returns: The value at the end of the list.
    public func removeLast() -> T? {
        guard !isEmpty else {
            return nil
        }

        guard head?.next != nil else {
            return pop()
        }

        var prev = head
        var currentNode = head?.next
        while currentNode?.next != nil {
            currentNode = currentNode?.next
            prev = prev?.next
        }

        prev?.next = nil
        tail = prev

        return currentNode?.value
    }

    /// Removes the node after the given node.
    ///
    /// - Complexity: O(1)
    /// - Parameter node: The node to use.
    /// - Returns: The value removed.
    @discardableResult
    public func remove(after node: LinkedListNode<T>) -> T? {
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }

        return node.next?.value
    }

}
