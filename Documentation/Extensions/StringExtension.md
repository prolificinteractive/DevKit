# String Extension

(Extensions/StringExtension)

## General Functions

```

    /// Generates a localized string with the given parameters.
    ///
    /// - Parameter comment: Comment for the localized string.
    /// - Returns: String that is localized.
    public func localized(comment: String) -> String

    /// Removes the trailing line after the given token.
    ///
    /// - Parameter token: Token to search for.
    /// - Returns: String of the removed trailing string. Includes removing the token.
    public func removeTrailing(startWith token: String) -> String

    /// Returns a string with leading and trailing whitespace trimmed.
    ///
    /// - Returns: String.
    public func whitespaceTrimmed() -> String
```

## Validation

```swift

    /// Determines if input string is valid and not empty.
    ///
    /// - Parameter input: String.
    /// - Returns: True, if not empty, false otherwise.
    public static func isValidInput(_ input: String?) -> Bool

    /// Determines if input string is a valid email address.
    ///
    /// - Parameter email: Email address.
    /// - Returns: True, if valid email, false otherwise.
    public static func validateEmail(_ email: String) -> Bool

    /// Determines if input string is a valid password entry.
    ///
    /// - Parameter password: Password.
    /// - Returns: True, if valid password, false otherwise.
    public static func validatePassword(_ password: String) -> Bool
```

## Social Media URls

```swift

    /// Extracts username from given url string.
    ///
    /// - Returns: Username if included in path.
    public func extractedUserName() -> String

    /// Returns a URL string given a Twitter handle.
    ///
    /// - Parameter username: Twitter handle.
    /// - Returns: URL string if handle given, nil otherwise.
    public static func twitterURL(with username: String?) -> String?


    /// Returns a URL string given a Facebook username.
    ///
    /// - Parameter username: Facebook username.
    /// - Returns: URL string if handle given, nil otherwise.
    public static func facebookURL(with username: String?) -> String?

    /// Returns a URL string given an Instagram username.
    ///
    /// - Parameter username: Instagram username.
    /// - Returns: URL string if handle given, nil otherwise.
    public static func instagramURL(with username: String?) -> String?
```
