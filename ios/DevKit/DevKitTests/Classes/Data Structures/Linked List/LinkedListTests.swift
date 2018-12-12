//
//  LinkedListTests.swift
//  DevKitTests
//
//  Created by Thibault Klein on 8/30/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import DevKit
import XCTest

class LinkedListTests: XCTestCase {

    func test_linkedList_Push() {
        // Given
        let linkedList = LinkedList<Int>()
        XCTAssertNil(linkedList.peek())

        // When
        linkedList.push(1)

        // Then
        XCTAssertEqual(linkedList.peek(), 1)
    }

    func test_linkedList_Append_EmptyList() {
        // Given
        let linkedList = LinkedList<Int>()
        XCTAssertNil(linkedList.tail)

        // When
        linkedList.append(4)

        // Then
        XCTAssertEqual(linkedList.tail!.value, 4)
    }

    func test_linkedList_Append() {
        // Given
        let linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        XCTAssertEqual(linkedList.tail!.value, 3)

        // When
        linkedList.append(4)

        // Then
        XCTAssertEqual(linkedList.tail!.value, 4)
    }

    func test_linkedList_InsertAt() {
        // Given
        let linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        guard let nodeAtIndex1 = linkedList.node(at: 1) else {
            XCTFail("Node is null when it should be valid.")
            return
        }
        XCTAssertEqual(nodeAtIndex1.value, 2)

        // When
        linkedList.insert(value: 4, after: nodeAtIndex1)
    }

    func test_linkedList_InsertAtTail() {
        // Given
        let linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)
        guard let nodeAtIndex2 = linkedList.node(at: 2) else {
            XCTFail("Node is null when it should be valid.")
            return
        }
        XCTAssertEqual(nodeAtIndex2.value, linkedList.tail!.value)

        // When
        linkedList.insert(value: 4, after: nodeAtIndex2)
    }

    func test_linkedList_PopWhenEmpty() {
        // Given
        let linkedList = LinkedList<Int>()

        // When
        let value = linkedList.pop()

        // Then
        XCTAssertNil(value)
    }

    func test_linkedList_Pop() {
        // Given
        let linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)

        // When
        let value = linkedList.pop()

        // Then
        XCTAssertEqual(value!, 1)
    }

    func test_linkedList_RemoveLastWhenEmpty() {
        // Given
        let linkedList = LinkedList<Int>()

        // When
        let value = linkedList.removeLast()

        // Then
        XCTAssertNil(value)
    }

    func test_linkedList_RemoveLastWhenOnly1Element() {
        // Given
        let linkedList = LinkedList<Int>()
        linkedList.push(1)

        // When
        let value = linkedList.removeLast()

        // Then
        XCTAssertEqual(value!, 1)
    }

    func test_linkedList_RemoveLast() {
        // Given
        let linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)

        // When
        let value = linkedList.removeLast()

        // Then
        XCTAssertEqual(value!, 3)
    }

    func test_linkedList_removeAfter() {
        // Given
        let linkedList = LinkedList<Int>()
        linkedList.push(3)
        linkedList.push(2)
        linkedList.push(1)

        // When
        let value = linkedList.remove(after: linkedList.head!)
        
        // Then
        XCTAssertEqual(value, 2)
        XCTAssertEqual(linkedList.head!.value, 1)
        XCTAssertEqual(linkedList.head!.next!.value, 3)
    }
}
