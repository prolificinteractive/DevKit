//
//  PasswordType.swift
//  DevKit
//
//  Created by Stanle De La Cruz on 11/12/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

/// Enum to determine the password type.
public enum ValidationType: String {
    
    /// Password contains lowercased letters.
    case lowercasedLetters = "(?=.*[a-z])"
    
    /// Password contains uppercased letters.
    case uppercasedLetters = "(?=.*[A-Z])"
    
    /// Password contains numbers.
    case numbers = "(?=.*[0-9])"
    
    /// Password contains special characters.
    case specialCharacters = "(?=.*[!@#$&*])"
    
    /// function that handles the type of Password and return the regex.
    public static func getRegexCode(with validators: [ValidationType], and minCharacters: Int) -> String {
        var regexCode = "^"
        validators.forEach { type in
            switch type {
            case .lowercasedLetters:
                regexCode += ValidationType.lowercasedLetters.rawValue
            case .uppercasedLetters:
                regexCode += ValidationType.uppercasedLetters.rawValue
            case .numbers:
                regexCode += ValidationType.numbers.rawValue
            case .specialCharacters:
                regexCode += ValidationType.specialCharacters.rawValue
            }
        }
        regexCode += ".{\(minCharacters),}$"
        return regexCode
    }
}
