//
//  Queueable.swift
//  DevKit
//
//  Created by Thibault Klein on 9/6/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// Defines how a queue can be implemented.
/// There are different techniques you can use to create a queue (array, doubly linked list, ring buffer, double stack...)
/// that can confirm to this protocol.
public protocol Queueable {
    associatedtype Element

    var isEmpty: Bool { get }

    func peek() -> Element?
    func enqueue(_ value: Element)
    func dequeue() -> Element?

}
