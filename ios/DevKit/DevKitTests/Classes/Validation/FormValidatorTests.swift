//
//  FormValidatorTests.swift
//  DevKitTests
//
//  Created by Stanle De La Cruz on 12/5/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import XCTest
@testable import DevKit
class FormValidatorTests: XCTestCase {

    var sut = FormValidator()
    
    // MARK:- Email
    
    func testValid_Email() {
        let email = "hello@gmail.com"
        let valid = sut.isValid(email)
        XCTAssertTrue(valid)
    }
    
    func testInvalid_Email() {
        let email = "hellogmail.com"
        let valid = sut.isValid(email)
        XCTAssertFalse(valid)
    }
    
    // MARK:- Email and Password with Validation type.
    
    func testValidForm_WithEmailAndPassword_Validators() {
        let email = "hello@gmail.com"
        let password = "hello123"
        let validators: [ValidationType] = [.numbers(count: 2)]
        let valid = sut.isValid(email, password: password, validators: validators)
        
        XCTAssertTrue(valid)
    }
    
    func testInvalidForm_WithEmailAndPassword_Validators() {
        let email = "hiiii"
        let password = "hello123"
        let validators: [ValidationType] = [.numbers(count: 2)]
        let valid = sut.isValid(email, password: password, validators: validators)
        
        XCTAssertFalse(valid)
    }
    
    func testValidForm_WithEmailAndPassword_WithRegexCode() {
        let email = "hello@gmail.com"
        let password = "hello123!A"
        let code = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{1,}$"
        let valid = sut.isValid(email, password: password, passwordRegex: code)
        
        XCTAssertTrue(valid)
    }
    
    func testInvalidForm_WithEmailAndPassword_WithRegexCode() {
        let email = "hiiii"
        let password = "hello123"
        let code = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{1,}$"
        let valid = sut.isValid(email, password: password, passwordRegex: code)
        
        XCTAssertFalse(valid)
    }
    
    // MARK:- Email, Password and confirmation password with Validation types.
    
    func testValidForm_WithEmailAndPasswordAndConfirmationPassword_WithValidationType() {
        let email = "hello@gmail.com"
        let password = "hello123!A"
        let confirmationPassword = "hello123!A"
        let validators: [ValidationType] = [.numbers(count: 1), .lowercasedLetters(count: 1)]
        let valid = sut.isValid(email,
                                password: password,
                                confirmationPassword: confirmationPassword,
                                validators: validators)
        
        XCTAssertTrue(valid)
    }
    
    func testInValidForm_WithEmailAndPasswordAndConfirmationPassword_WithValidationType() {
        let email = "hello@gmail.com"
        let password = "hello123!A"
        let confirmationPassword = "hello123!ZZZZZZ"
        let validators: [ValidationType] = [.numbers(count: 1), .lowercasedLetters(count: 1)]
        let valid = sut.isValid(email,
                                password: password,
                                confirmationPassword: confirmationPassword,
                                validators: validators)
        
        XCTAssertFalse(valid)
    }
    
    // MARK:- Email, Password and confirmation password with Regex code.
    
    func testValidForm_WithEmailAndPasswordAndConfirmationPassword_WithRegexCode() {
        let email = "hello@gmail.com"
        let password = "hello123!A"
        let confirmationPassword = "hello123!A"
        let code = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{1,}$"
        let valid = sut.isValid(email, password: password, confirmationPassword: confirmationPassword, passwordRegex: code)
        
        XCTAssertTrue(valid)
    }
    
    func testInValidForm_WithEmailAndPasswordAndConfirmationPassword_WithRegexCode() {
        let email = "hello@gmail.com"
        let password = "hello123!A"
        let confirmationPassword = "hello123!ZZZZZZ"
        let code = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{1,}$"
        let valid = sut.isValid(email, password: password, confirmationPassword: confirmationPassword, passwordRegex: code)
        
        XCTAssertFalse(valid)
    }
    
    // MARK:- Password with Validation type.
    
    func testValidPassword_WithValidationType() {
        let password = "h2ss1"
        let validators: [ValidationType] = [.lowercasedLetters(count: 1)]
        let valid = sut.isValid(password, validators: validators)
        
        XCTAssertTrue(valid)
    }
    
    func testInvalidPassword_WithValidationType() {
        let password = "12345!!"
        let validators: [ValidationType] = [.lowercasedLetters(count: 1)]
        let valid = sut.isValid(password, validators: validators)
        
        XCTAssertFalse(valid)
    }
    
    func testValidPassword_WithValidationType_MinCharacters() {
        let password = "h2ss1"
        let validators: [ValidationType] = [.minCharacters(count: 1)]
        let valid = sut.isValid(password, validators: validators)
        
        XCTAssertTrue(valid)
    }
    
    func testInValidPassword_WithValidationType_MinCharacters() {
        let password = "h2ss1"
        let validators: [ValidationType] = [.minCharacters(count: password.count + 1)]
        let valid = sut.isValid(password, validators: validators)
        
        XCTAssertFalse(valid)
    }
    
    func testValidPassword_WithValidationType_EmptyValidator() {
        let password = "h2ss1"
        let validators: [ValidationType] = []
        let valid = sut.isValid(password, validators: validators)
        
        XCTAssertTrue(valid)
    }
    
    func testInValidPassword_WithValidationType_EmptyValidator() {
        let password = ""
        let validators: [ValidationType] = []
        let valid = sut.isValid(password, validators: validators)
        
        XCTAssertFalse(valid)
    }
    
    // MARK:- Password with Regex code.
    
    func testValidPassword_WithRegexCode() {
        let password = "h2A!"
        let code = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{1,}$"
        let valid = sut.isValid(password, passwordRegex: code)
        
        XCTAssertTrue(valid)
    }
    
    func testInvalidPassword_WithRegexCode() {
        let password = "h2A"
        let code = "^(?=.*[a-z])(?=.*[0-9])(?=.*[A-Z])(?=.*[!@#$&*]).{1,}$"
        let valid = sut.isValid(password, passwordRegex: code)
        
        XCTAssertFalse(valid)
    }
}
