//
//  QueueArrayTests.swift
//  DevKitTests
//
//  Created by Thibault Klein on 9/7/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import DevKit
import XCTest

class QueueArrayTests: XCTestCase {

    func test_queueArray_IsEmpty_EmptyList() {
        // Given
        let queue = QueueArray<Int>()
        // Then
        XCTAssertTrue(queue.isEmpty)
    }

    func test_queueArray_IsEmpty_NonEmptyList() {
        // Given
        let queue = QueueArray<Int>()
        // When
        queue.enqueue(1)
        // Then
        XCTAssertFalse(queue.isEmpty)
    }

    func test_queueArray_Peek_EmptyList() {
        // Given
        let queue = QueueArray<Int>()
        // Then
        XCTAssertNil(queue.peek())
    }

    func test_queueArray_Enqueue() {
        // Given
        let queue = QueueArray<Int>()
        XCTAssertNil(queue.peek())
        // When
        queue.enqueue(1)
        // Then
        XCTAssertEqual(queue.peek()!, 1)
    }

    func test_queueArray_Dequeue_EmptyList() {
        // Given
        let queue = QueueArray<Int>()
        XCTAssertNil(queue.peek())
        // When
        queue.enqueue(1)
        // Then
        XCTAssertEqual(queue.dequeue()!, 1)
    }

    func test_queueArray_Dequeue() {
        // Given
        let queue = QueueArray<Int>()
        XCTAssertNil(queue.peek())
        // When
        queue.enqueue(1)
        queue.enqueue(2)
        queue.enqueue(3)
        // Then
        XCTAssertEqual(queue.dequeue()!, 1)
    }

}
