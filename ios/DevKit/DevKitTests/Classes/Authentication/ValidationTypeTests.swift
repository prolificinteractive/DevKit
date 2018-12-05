//
//  ValidationTypeTests.swift
//  DevKitTests
//
//  Created by Jonathan Samudio on 11/28/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import XCTest
@testable import DevKit

class ValidationTypeTests: XCTestCase {

    override func setUp() {
        // DO IT HERE
    }

    // MARK: - Single

    func testGetRegexCode_LowercaseLetters_Single() {
        // Given
        let validationType = ValidationType.lowercasedLetters(num: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[a-z])")
    }

    func testGetRegexCode_UppercasedLetters_Single() {
        // Given
        let validationType = ValidationType.uppercasedLetters(num: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[A-Z])")
    }

    func testGetRegexCode_Numbers_Single() {
        // Given
        let validationType = ValidationType.numbers(num: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[0-9])")
    }

    func testGetRegexCode_SpecialCharacters_Single() {
        // Given
        let validationType = ValidationType.specialCharacters(num: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[!@#$&*])")
    }

    func testGetRegexCode_MinCharacters_Single() {
        // Given
        let num = 1
        let validationType = ValidationType.minCharacters(num: num)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^.{\(num),}$")
    }

    // MARK: - Multiple Numbers

    func testGetRegexCode_LowercaseLetters_Multiple() {
        // Given
        let validationType = ValidationType.lowercasedLetters(num: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[a-z])")
    }

    func testGetRegexCode_UppercasedLetters_Multiple() {
        // Given
        let validationType = ValidationType.uppercasedLetters(num: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[A-Z])")
    }

    func testGetRegexCode_Numbers_Multiple() {
        // Given
        let validationType = ValidationType.numbers(num: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[0-9])")
    }

    func testGetRegexCode_SpecialCharacters_Multiple() {
        // Given
        let validationType = ValidationType.specialCharacters(num: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[!@#$&*])")
    }

    func testGetRegexCode_MinCharacters_Multiple() {
        // Given
        let num = 2
        let validationType = ValidationType.minCharacters(num: num)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^.{\(num),}$")
    }

    // MARK: - All Regex Codes

    func testGetRegexCode_AllCodes_Single() {
        // Given
        let num = 1
        let validationTypes = [ValidationType.lowercasedLetters(num: num),
                              ValidationType.numbers(num: num),
                              ValidationType.uppercasedLetters(num: num),
                              ValidationType.specialCharacters(num: num),
                              ValidationType.minCharacters(num: num)]

        // When
        let result = ValidationType.getRegexCode(with: validationTypes)

        // Then
        XCTAssertEqual(result, "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{\(num),}$")
    }

    func testGetRegexCode_AllCodes_Multiple() {
        // Given
        let num = 2
        let validationTypes = [ValidationType.lowercasedLetters(num: num),
                              ValidationType.numbers(num: num),
                              ValidationType.uppercasedLetters(num: num),
                              ValidationType.specialCharacters(num: num),
                              ValidationType.minCharacters(num: num)]

        // When
        let result = ValidationType.getRegexCode(with: validationTypes)

        // Then
        XCTAssertEqual(result, "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{\(num),}$")
    }
}
