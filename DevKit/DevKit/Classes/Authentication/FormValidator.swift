//
//  Validator.swift
//  DevKit
//
//  Created by Stanle De La Cruz on 11/12/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// FormValidator used to validate sign up forms.
public class FormValidator {
    
    /// Validates the password with the given validation types and minimum Characters.
    /// - Parameters:
    ///   - password: The email given.
    ///   - passwordType: The type of password.
    public static func isValid(_ password: String, validators: [ValidationType], minCharacters: Int) -> Bool {
        return isValid(password, passwordRegex: ValidationType.getRegexCode(with: validators, and: minCharacters))
    }
    
    /// Validates the email and password with the given validation types and minimum characters.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - passwordType: The type of password.
    ///   - minCharacters: The minimum characters for the password.
    public static func isValid(_ email: String, password: String, validators: [ValidationType], minCharacters: Int) -> Bool {
        return isValid(email) && isValid(password, validators: validators, minCharacters: minCharacters)
    }
    
    /// Validates the email, password and confirmation password with the given validation types and minimum characters.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - confirmationPassword: The confirmation password given.
    ///   - passwordType: The type of password.
    ///   - minCharacters: The minimum characters for the password.
    public static func isValid(_ email: String, password: String, confirmationPassword: String, validators: [ValidationType], minCharacters: Int) -> Bool {
        return isValid(email)
            && password == confirmationPassword
            && isValid(password, validators: validators, minCharacters: minCharacters)
    }
    
    /// Validates the email and password with the given password regex code.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - passwordRegex: The password regex code.
    public static func isValid(_ email: String, password: String, passwordRegex: String) -> Bool {
        return isValid(email) && isValid(password, passwordRegex: passwordRegex)
    }
    
    /// Validates the email, password and confirmation password with the given password regex code.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - passwordRegex: The password regex code.
    public static func isValid(_ email: String, password: String, confirmationPassword: String, passwordRegex: String) -> Bool {
        return isValid(email)
            && password == confirmationPassword
            && isValid(password, passwordRegex: passwordRegex)
    }
    
    /// Validates the password with the given regex code.
    /// - Parameters:
    ///   - password: The password given.
    ///   - passwordRegex: The password regex code.
    public static func isValid(_ password: String, passwordRegex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    /// Validates the Email.
    /// - Parameters:
    ///   - email: the email given.
    public static func isValid(_ email: String) -> Bool {
        let dataDetector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let start = 0
        let end = email.count
        let range = NSRange(location: start, length: end)
        guard let match = dataDetector?.matches(in: email, options: [], range: range).first else {
            return false
        }
        return match.url?.absoluteString.starts(with: "mailto:") ?? false
            && match.range.location == start
            && match.range.length == end
    }
}
