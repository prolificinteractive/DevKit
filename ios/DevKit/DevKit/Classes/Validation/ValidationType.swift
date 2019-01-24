//
//  PasswordType.swift
//  DevKit
//
//  Created by Stanle De La Cruz on 11/12/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

/// Enum to determine the password type.
///
/// **Subspec: Validation/ValidationType**
///
/// - lowercasedLetters
/// - uppercasedLetters
/// - specialCharacters
/// - numbers
/// - minCharacters
///
public enum ValidationType {
    
    /// Password contains lowercased letters.
    case lowercasedLetters(count: Int)
    
    /// Password contains uppercased letters.
    case uppercasedLetters(count: Int)
    
    /// Password contains numbers.
    case numbers(count: Int)
    
    /// Password contains special characters.
    case specialCharacters(count: Int)

    /// Password minimun characters
    case minCharacters(count: Int)
    
    // Function returns a constructed regex code from the given validators.
    ///
    /// - Parameters:
    ///   - validators: Validation types required.
    ///   - minCharacters: The minimum characters for the given password.
    /// - Returns: Regex code.
    static func getRegexCode(with validators: [ValidationType]) -> String {
        var regexCode = "^"
        var didProvideMinCharacters = false
        validators.forEach { type in
            switch type {
            case .lowercasedLetters(let count):
                regexCode += generateRegex(from: "(?=.*[a-z])", and: count)
            case .uppercasedLetters(let count):
                regexCode += generateRegex(from: "(?=.*[A-Z])", and: count)
            case .numbers(let count):
                regexCode += generateRegex(from: "(?=.*[0-9])", and: count)
            case .specialCharacters(let count):
                regexCode += generateRegex(from: "(?=.*[!@#$&*])", and: count)
            case .minCharacters(let num):
                didProvideMinCharacters = true
                regexCode += ".{\(num),}$"
            }
        }
        if !didProvideMinCharacters {
            regexCode += ".{1,}$"
        }
        return regexCode
    }
    
    static func checkForOnlyMinCharacters(_ password: String, validators: [ValidationType]) -> Bool {
        guard let firstValidator = validators.first else {
            return password.count > 0
        }
        if validators.count == 1 {
            switch firstValidator {
            case .minCharacters(let count):
                return password.count >= count
            default:
                // Should never happen, consider assert
                return false
            }
        }
        return false
    }
    
    // Function generates a regex code from the given validation .
    ///
    /// - Parameters:
    ///   - code: The regex code for the Validation type.
    ///   - minCharacters: The count to construct the corresponding regex code.
    /// - Returns: Regex code.
    private static func generateRegex(from code: String, and count: Int) -> String {
        let periodSeparatedString = code.components(separatedBy: ".")
        let codeString = String(".\(periodSeparatedString[1])".dropLast())
        return periodSeparatedString[0] + String(repeating: codeString, count: count) + ")"
    }
}
