//
//  PasswordType.swift
//  DevKit
//
//  Created by Stanle De La Cruz on 11/12/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

/// Enum to determine the password type.
///
/// **Subspec: Authentication/ValidationType**
///
/// - lowercasedLetters
/// - uppercasedLetters
/// - specialCharacters
/// - numbers
///
public enum ValidationType {
    
    /// Password contains lowercased letters.
    case lowercasedLetters(num: Int)
    
    /// Password contains uppercased letters.
    case uppercasedLetters(num: Int)
    
    /// Password contains numbers.
    case numbers(num: Int)
    
    /// Password contains special characters.
    case specialCharacters(num: Int)

    case minCharacters(num: Int)
    
    /// function that handles the type of Password and return the regex.
    ///
    /// - Parameters:
    ///   - validators: Validation types required.
    ///   - minCharacters: The minimum characters for the given password.
    /// - Returns: Regex code.
    public static func getRegexCode(with validators: [ValidationType]) -> String {
        var regexCode = "^"
        validators.forEach { type in
            switch type {
            case .lowercasedLetters:
                regexCode += "(?=.*[a-z])"
            case .uppercasedLetters:
                regexCode += "(?=.*[A-Z])"
            case .numbers:
                regexCode += "(?=.*[0-9])"
            case .specialCharacters:
                regexCode += "(?=.*[!@#$&*])"
            case .minCharacters(let num):
                regexCode += ".{\(num),}$"
            }
        }
        return regexCode
    }
}
