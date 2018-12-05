//
//  Validator.swift
//  DevKit
//
//  Created by Stanle De La Cruz on 11/12/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

import Foundation

/// FormValidator used to validate sign up forms.
///
/// **Subspec: Authentication/FormValidator**
///
/// ```
//    func isValidForm(_ email: String, password: String, validators: [ValidationType]) -> Bool {
//        let formValidator = FormValidator()
//        return formValidator.isValid(email,
//                                     password: password,
//                                     validators: validators)
//    }
/// ```
///
/// The FormValidator allows to evaluate sign up forms easily. Simply provide email, password and the type of validation you
/// want to specify for the given password.
/// FormValidator is only mean't to be used for Sign up forms.
public class FormValidator {
    
    /// Empty constructor.
    public init() {}
    
    /// Validates the password with the given validation types and minimum Characters.
    /// - Parameters:
    ///   - password: The email given.
    ///   - validators: The validators for your password.
    public func isValid(_ password: String, validators: [ValidationType]) -> Bool {
        return isValid(password, passwordRegex: ValidationType.getRegexCode(with: validators))
    }
    
    /// Validates the email and password with the given validation types and minimum characters.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - validators: The validators for your password.
    public func isValid(_ email: String, password: String, validators: [ValidationType]) -> Bool {
        return isValid(email) && isValid(password, validators: validators)
    }
    
    /// Validates the email, password and confirmation password with the given validation types and minimum characters.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - confirmationPassword: The confirmation password given.
    ///   - validators: The validators for your password.
    public func isValid(_ email: String,
                               password: String,
                               confirmationPassword: String,
                               validators: [ValidationType]) -> Bool {
        return isValid(email)
            && password == confirmationPassword
            && isValid(password, validators: validators)
    }
    
    /// Validates the email and password with the given password regex code.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - passwordRegex: The password regex code.
    public func isValid(_ email: String, password: String, passwordRegex: String) -> Bool {
        return isValid(email) && isValid(password, passwordRegex: passwordRegex)
    }
    
    /// Validates the email, password and confirmation password with the given password regex code.
    /// - Parameters:
    ///   - email: the email given.
    ///   - password: The password given.
    ///   - confirmationPassword: The confirmation password given.
    ///   - passwordRegex: The password regex code.
    public func isValid(_ email: String,
                               password: String,
                               confirmationPassword: String,
                               passwordRegex: String) -> Bool {
        return isValid(email)
            && password == confirmationPassword
            && isValid(password, passwordRegex: passwordRegex)
    }
    
    /// Validates the password with the given regex code.
    /// - Parameters:
    ///   - password: The password given.
    ///   - passwordRegex: The password regex code.
    public func isValid(_ password: String, passwordRegex: String) -> Bool {
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
    }
    
    /// Validates the Email.
    /// - Parameters:
    ///   - email: the email given.
    public func isValid(_ email: String) -> Bool {
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
