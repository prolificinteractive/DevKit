//
//  StackTests.swift
//  DevKitTests
//
//  Created by Thibault Klein on 8/31/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import DevKit
import XCTest

class StackTests: XCTestCase {

    func test_stack_isEmpty() {
        // Given
        let stack = Stack<Int>()
        XCTAssertTrue(stack.isEmpty)
        // When
        stack.push(1)
        // Then
        XCTAssertFalse(stack.isEmpty)
    }

    func test_stack_push() {
        // Given
        let stack = Stack<Int>()
        // When
        stack.push(1)
        stack.push(2)
        // Then
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(stack.peek(), 2)
    }

    func test_stack_pop() {
        // Given
        let stack = Stack<Int>()
        // When
        stack.push(1)
        stack.push(2)
        stack.push(3)
        let poppedValue = stack.pop()
        // Then
        XCTAssertFalse(stack.isEmpty)
        XCTAssertEqual(poppedValue, 3)
        XCTAssertEqual(stack.peek(), 2)
    }

}
