//
//  ValidationTypeTests.swift
//  DevKitTests
//
//  Created by Stanle De La Cruz on 11/28/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import DevKit

class ValidationTypeTests: XCTestCase {

    // MARK: - Single

    func testGetRegexCode_LowercaseLetters_Single() {
        // Given
        let validationType = ValidationType.lowercasedLetters(count: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[a-z]).{1,}$")
    }

    func testGetRegexCode_UppercasedLetters_Single() {
        // Given
        let validationType = ValidationType.uppercasedLetters(count: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[A-Z]).{1,}$")
    }

    func testGetRegexCode_Numbers_Single() {
        // Given
        let validationType = ValidationType.numbers(count: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[0-9]).{1,}$")
    }

    func testGetRegexCode_SpecialCharacters_Single() {
        // Given
        let validationType = ValidationType.specialCharacters(count: 1)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[!@#$&*]).{1,}$")
    }

    func testGetRegexCode_MinCharacters_Single() {
        // Given
        let num = 1
        let validationType = ValidationType.minCharacters(count: num)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^.{\(num),}$")
    }

    // MARK: - Multiple Numbers

    func testGetRegexCode_LowercaseLetters_Multiple() {
        // Given
        let validationType = ValidationType.lowercasedLetters(count: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[a-z].*[a-z]).{1,}$")
    }

    func testGetRegexCode_UppercasedLetters_Multiple() {
        // Given
        let validationType = ValidationType.uppercasedLetters(count: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[A-Z].*[A-Z]).{1,}$")
    }

    func testGetRegexCode_Numbers_Multiple() {
        // Given
        let validationType = ValidationType.numbers(count: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[0-9].*[0-9]).{1,}$")
    }

    func testGetRegexCode_SpecialCharacters_Multiple() {
        // Given
        let validationType = ValidationType.specialCharacters(count: 2)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^(?=.*[!@#$&*].*[!@#$&*]).{1,}$")
    }

    func testGetRegexCode_MinCharacters_Multiple() {
        // Given
        let num = 2
        let validationType = ValidationType.minCharacters(count: num)

        // When
        let result = ValidationType.getRegexCode(with: [validationType])

        // Then
        XCTAssertEqual(result, "^.{\(num),}$")
    }

    // MARK: - All Regex Codes
    
    func testGetRegexCode_AllCodes_Single() {
        // Given
        let num = 1
        let validationTypes = [ValidationType.lowercasedLetters(count: num),
                               ValidationType.numbers(count: num),
                               ValidationType.uppercasedLetters(count: num),
                               ValidationType.specialCharacters(count: num),
                               ValidationType.minCharacters(count: num)]
        
        // When
        let result = ValidationType.getRegexCode(with: validationTypes)
        
        // Then
        XCTAssertEqual(result, "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{\(num),}$")
    }

    func testGetRegexCode_AllCodes_Multiple() {
        // Given
        let lowercasedLettersCount = 1
        let numbersCount = 2
        let uppercasedLettersCount = 3
        let specialCharactersCount = 2
        let minCharacters = 10
        let validationTypes = [ValidationType.lowercasedLetters(count: lowercasedLettersCount),
                              ValidationType.numbers(count: numbersCount),
                              ValidationType.uppercasedLetters(count: uppercasedLettersCount),
                              ValidationType.specialCharacters(count: specialCharactersCount),
                              ValidationType.minCharacters(count: minCharacters)]

        // When
        let result = ValidationType.getRegexCode(with: validationTypes)

        // Then
        XCTAssertEqual(result, "^(?=.*[a-z])(?=.*[0-9].*[0-9])(?=.*[A-Z].*[A-Z].*[A-Z])(?=.*[!@#$&*].*[!@#$&*]).{\(minCharacters),}$")
    }
    
    // MARK: Only Min Characters
    
    func testcheckForOnlyMinCharacter_Single_Success() {
        // Given
        let password = "a"
        
        // When
        let isMinCharacter = ValidationType.checkForOnlyMinCharacters(password, validators: [.minCharacters(count: 1)])
        
        // Then
        XCTAssertTrue(isMinCharacter)
    }
    
    func testcheckForOnlyMinCharacter_Single_Fail() {
        // Given
        let password = "a"
        
        // When
        let isMinCharacter = ValidationType.checkForOnlyMinCharacters(password, validators: [.minCharacters(count: 2)])
        
        // Then
        XCTAssertFalse(isMinCharacter)
    }
    
    func testcheckForOnlyMinCharacters_Multiple_Success() {
        // Given
        let password = "hello123"
        
        // When
        let isMinCharacter = ValidationType.checkForOnlyMinCharacters(password, validators: [.minCharacters(count: password.count)])
        
        // Then
        XCTAssertTrue(isMinCharacter)
    }
    
    func testcheckForOnlyMinCharacters_Multiple_Fail() {
        // Given
        let password = "hello123"
        
        // When
        let isMinCharacter = ValidationType.checkForOnlyMinCharacters(password, validators: [.minCharacters(count: password.count + 1)])
        
        // Then
        XCTAssertFalse(isMinCharacter)
    }
    
    // MARK: Empty Validator
    
    func testEmptyValidator_Success() {
        // Given
        let password = "a"
        
        // When
        let isMinCharacter = ValidationType.checkForOnlyMinCharacters(password, validators: [])
        
        // Then
        XCTAssertTrue(isMinCharacter)
    }
    
    func testEmptyValidator_Failure() {
        // Given
        let password = ""
        
        // When
        let isMinCharacter = ValidationType.checkForOnlyMinCharacters(password, validators: [])
        
        // Then
        XCTAssertFalse(isMinCharacter)
    }
}
