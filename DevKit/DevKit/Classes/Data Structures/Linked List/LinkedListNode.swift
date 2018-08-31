//
//  LinkedListNode.swift
//  DevKit
//
//  Created by Thibault Klein on 8/30/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// Describes a node in a linked list.
open class LinkedListNode<T> {

    // MARK: - Public Properties
    public var value: T
    public var next: LinkedListNode?

    // MARK: - Initialization

    public init(value: T, next: LinkedListNode? = nil) {
        self.value = value
        self.next = next
    }

}
