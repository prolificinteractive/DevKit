//
//  SessionManager.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/8/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Foundation
import KeychainAccess

/// Session manager used to manage a user's login status.
///
/// **Subspec: Utility/SessionManager**
///
/// ```
/// let sessionManager = SessionManager<User>()
/// ```
///
/// Given a Codable user object, the SessionManager will store the authentication token in the secure keychain and will store
/// the user object into the user defaults for fast sign-in when the app is relaunched.
///
open class SessionManager<T: Codable> {

    // MARK: - Public Properties

    /// Authentication token of the current user.
    public var authToken: String? {
        get {
            return keychainString(authTokenKeychainKey)
        }
        set(newAuthToken) {
            setKeychainString(authTokenKeychainKey, value: newAuthToken)
        }
    }

    /// Current user of the application.
    public var user: T? {
        set {
            let encoder = JSONEncoder()
            UserDefaults.standard.set(try? encoder.encode(newValue), forKey: userKey)
        }
        get {
            let decoder = JSONDecoder()
            if let data = UserDefaults.standard.data(forKey: userKey) {
                return try? decoder.decode(T.self, from: data)
            } else {
                return nil
            }
        }
    }

    /// Flag to determine if the user is logged in.
    public var isLoggedIn: Bool {
        return (authToken != nil) && (user != nil)
    }

    // MARK: - Private Properties

    /// Keychain service used to access the keychain.
    private lazy var keychain: Keychain = {
        return Keychain(service: bundleIdentifer)
    }()

    /// Bundle identifier of the app.
    private var bundleIdentifer: String {
        guard let identifier = Bundle.main.bundleIdentifier else {
            return "com.default"
        }
        return identifier
    }

    /// Authentication token keychain key.
    private var authTokenKeychainKey: String {
        return bundleIdentifer + ".authtoken"
    }

    // MARK: - Constants

    /// User key to access the user object from the UserDefaults.
    private let userKey = "user"

    // MARK: - Initialization

    /// Default initializer. Reloads the user stored in the user defaults.
    public init() {
        loadStoredUser()
    }

    // MARK: - Public Functions

    /// Log out the current user.
    public func logOut() {
        user = nil
        authToken = nil
    }

}

// MARK: - Private Functions
private extension SessionManager {

    /// Reloads the user that is stored in the user defaults.
    func loadStoredUser() {
        guard let data = UserDefaults.standard.object(forKey: userKey) as? Data else {
            return
        }
        let decoder = JSONDecoder()
        user = try? decoder.decode(T.self, from: data)
    }

    /// Returns the string with the given identifer.
    ///
    /// - Parameter identifier: Keychain id used to return the desired string.
    /// - Returns: Optional string stored in the keychain.
    func keychainString(_ identifier: String) -> String? {
        do {
            return try keychain.getString(identifier)
        } catch {
            print("Keychain retrieval error.")
        }
        return nil
    }

    /// Sets the value provided to the keychain.
    ///
    /// - Parameters:
    ///   - identifier: Key identidier of the value.
    ///   - value: String value to add to the keychain.
    func setKeychainString(_ identifier: String, value: String?) {
        guard let value = value else {
            removeKeychainString(identifier)
            return
        }

        do {
            try keychain.set(value, key: identifier)
        } catch {
            print("Keychain set failed.")
        }
    }

    /// Removes the keychain string with the given parameter.
    ///
    /// - Parameter identifier: Key identifier to remove.
    func removeKeychainString(_ identifier: String) {
        do {
            try keychain.remove(identifier)
        } catch {
            print("Keychain remove failed")
        }
    }

}
