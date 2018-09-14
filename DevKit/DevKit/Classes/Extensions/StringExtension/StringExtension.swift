//
//  StringExtension.swift
//  TheWing
//
//  Created by Jonathan Samudio on 2/28/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation

/// Collection of all String Extensions.
///
/// **Subspec: Extensions/StringExtension**
///
extension String {

    // MARK: - General Extension Functions

    /// Generates a localized string with the given parameters.
    ///
    /// - Parameter comment: Comment for the localized string.
    /// - Returns: String that is localized.
    public func localized(comment: String) -> String {
        return NSLocalizedString(self, comment: comment)
    }
    
    /// Removes the trailing line after the given token.
    ///
    /// - Parameter token: Token to search for.
    /// - Returns: String of the removed trailing string. Includes removing the token.
    public func removeTrailing(startWith token: String) -> String {
        if let token = range(of: token) {
            var newString = self
            newString.removeSubrange(token.lowerBound..<endIndex)
            return newString
        }
        return self
    }
    
    /// Returns a string with leading and trailing whitespace trimmed.
    ///
    /// - Returns: String.
    public func whitespaceTrimmed() -> String {
        return self.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
    
}

extension String {

    // MARK: - Validation
    
    /// Determines if input string is valid and not empty.
    ///
    /// - Parameter input: String.
    /// - Returns: True, if not empty, false otherwise.
    public static func isValidInput(_ input: String?) -> Bool {
        return !(input?.whitespaceTrimmed().isEmpty ?? true)
    }
    
    /// Determines if input string is a valid email address.
    ///
    /// - Parameter email: Email address.
    /// - Returns: True, if valid email, false otherwise.
    public static func validateEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }
    
    /// Determines if input string is a valid password entry.
    ///
    /// - Parameter password: Password.
    /// - Returns: True, if valid password, false otherwise.
    public static func validatePassword(_ password: String) -> Bool {
        return password.count > 0
    }

}

extension String {

    // MARK: - Social Media URLs

    /// Extracts username from given url string.
    ///
    /// - Returns: Username if included in path.
    public func extractedUserName() -> String {
        guard let url = URL(string: self) else {
            return ""
        }
        return url.lastPathComponent.isEmpty ? "" : url.lastPathComponent
    }
    
    /// Returns a URL string given a Twitter handle.
    ///
    /// - Parameter username: Twitter handle.
    /// - Returns: URL string if handle given, nil otherwise.
    public static func twitterURL(with username: String?) -> String? {
        guard let username = username else {
            return nil
        }
        
        guard isValidInput(username) else {
            return ""
        }
        
        return "https://twitter.com/\(username)"
    }

    /// Returns a URL string given a Facebook username.
    ///
    /// - Parameter username: Facebook username.
    /// - Returns: URL string if handle given, nil otherwise.
    public static func facebookURL(with username: String?) -> String? {
        guard let username = username else {
            return nil
        }
        
        guard isValidInput(username) else {
            return ""
        }
        
        return "https://facebook.com/\(username)"
    }
    
    /// Returns a URL string given an Instagram username.
    ///
    /// - Parameter username: Instagram username.
    /// - Returns: URL string if handle given, nil otherwise.
    public static func instagramURL(with username: String?) -> String? {
        guard let username = username else {
            return nil
        }
        
        guard isValidInput(username) else {
            return ""
        }
        
        return "https://instagram.com/\(username)"
    }
    
}
