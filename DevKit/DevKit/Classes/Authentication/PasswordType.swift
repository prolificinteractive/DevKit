//
//  PasswordType.swift
//  DevKit
//
//  Created by Stanle De La Cruz on 11/12/18.
//  Copyright © 2018 Jonathan Samudio. All rights reserved.
//

/// Enum to determine the password type.
public enum PasswordType {
    
    /// Password contains at least one Alphabet and a Special Character.
    case alphabetSpecialCharacter
    
    /// Password contains at least one lowercased, Special character and a number.
    case alphabetNumberSpecialCharacter
    
    /// Password contains at least one number and one lowercased Alphabet letter.
    case alphabetNumber
    
    /// Password contains at least one Number and a Special Character
    case numberSpecialCharacter
    
    /// Password contains at least one character
    case simple
    
    /// Password contains at least two uppercase letters, two numbers, three lowercased letters and a Special Character.
    case strong
    
    /// function that handles the type of Password and return the regex.
    func type(_ minCharacters: Int) -> String {
        switch self {
        case .simple:
            return "^(?=.*[a-z]).{\(minCharacters),}$"
        case .alphabetSpecialCharacter:
            return "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]).{\(minCharacters),}$"
        case .alphabetNumberSpecialCharacter:
            return "^(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{0,}$"
        case .numberSpecialCharacter:
            return "^(?=.*[!@#$&*])(?=.*[0-9]).{\(minCharacters),}$"
        case .alphabetNumber:
            return "^(?=.*[0-9])(?=.*[a-z]).{\(minCharacters),}$"
        case .strong:
            return "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{\(minCharacters),}$"
        }
    }
}
