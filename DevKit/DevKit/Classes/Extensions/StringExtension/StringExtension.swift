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

    /// Initialization using unicode name.
    ///
    /// - Parameter unicodeNameString: Unicode name as string.
    public init(unicodeNameString: String) {
        if let unicode = Int(unicodeNameString.replacingOccurrences(of: "U+", with: ""), radix: 16),
            let scalar = UnicodeScalar(unicode) {
            self = String(scalar)
        } else {
            self = ""
        }
    }

    /// Returns a string if the optional string instance is not nil or empty, otherwise nil.
    public var whitespaceTrimmedAndNilIfEmpty: String? {
        return whitespaceTrimmed.isEmpty ? nil : self
    }

    /// Returns a string with leading and trailing whitespace trimmed.
    public var whitespaceTrimmed: String {
        return trimmingCharacters(in: .whitespacesAndNewlines)
    }

    /// New string, capitalizes first letter
    ///
    /// - Returns: A string with the first letter capitalized
    public func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + dropFirst()
    }

    /// Mutates self to be the capitalized first letter version
    public mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }

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

    /// Returns nil if empty, quite useful when "" means the same as nil to you.
    public var nilIfEmpty: String? {
        return isEmpty ? nil : self
    }

    /// Is this string a valid URL?
    public var isValidUrl: Bool {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: utf16.count))
        if let matchUrl = matches?.first?.url, let url = url {
            return url.absoluteString == matchUrl.absoluteString
        }
        return false
    }

    /// Attempt to build a url with this string.
    public var url: URL? {
        return URL(string: urlString)
    }

    /// Attempt to build a url string with this string, check for http because no one cares about that.
    public var urlString: String {
        var urlString = self
        if !(urlString.contains("://")) {
            urlString = "https://\(urlString)"
        }
        return urlString
    }

}

extension String {

    // MARK: - Validation

    /// Determines if string is not empty and valid.
    public var isValidString: Bool {
        return !whitespaceTrimmed.isEmpty
    }

    /// Determines if email is valid.
    public var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    /// Determines is password is valid.
    public var isValidPassword: Bool {
        return count > 0
    }

    /// Determines if input string is not nil and valid.
    ///
    /// - Parameter input: Optional string.
    /// - Returns: True, if not nil and valid, false otherwise.
    public static func isValidInput(_ input: String?) -> Bool {
        guard let input = input, input.isValidString else {
            return false
        }
        return true
    }

}

extension String {

    // MARK: - Social Media URLs

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

    /// Determines if the handles is valid.
    public var isValidHandle: Bool {
        return !contains("@") && isValidSocialLink
    }

    /// Determine if the social link is valid.
    public var isValidSocialLink: Bool {
        let httpCount = components(separatedBy: "/").filter { $0.contains("http") }.count
        return httpCount == 1 && !contains("www.")
    }

    /// Extracts username from given url string.
    ///
    /// - Returns: Username if included in path.
    public func extractedUserName() -> String {
        guard let url = URL(string: self) else {
            return ""
        }
        return url.lastPathComponent.isEmpty ? "" : url.lastPathComponent
    }

}
