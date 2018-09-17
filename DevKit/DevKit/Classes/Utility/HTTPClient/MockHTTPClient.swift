//
//  MockHTTPClient.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/7/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Alamofire

/// Mock http client handles mocks JSON requests.
///
/// **Subspec: Utility/HTTPClient**
///
/// ```
/// mockHTTPClient.perform(jsonFileName: "Events") { (resposnse: Result<[Event]>) in
///     // Handle response.
/// }
/// ```
///
/// The MockHTTPClient can load and decode the contents of a JSON file into a swift network model. The JSON file needs to be
/// within the project directory.
///
open class MockHTTPClient {

	// MARK: - Private Properties

    /// Data decoder used to decode the JSON files.
    private static let decoder = DataDecoder()

    /// Containts the json file names as a key and the json string content as the value.
    private lazy var jsonMockFiles: [String: String] = {
        return MockHTTPClient.loadMockFiles()
    }()

	// MARK: - Public Functions

    /// Performs a mock network request.
    ///
    /// - Parameters:
    ///   - jsonFileName: File name of the json file.
    ///   - completion: Network completion that describes how the data should be deserialized.
    public func perform<T: Decodable>(jsonFileName: String, completion: @escaping (_ result: Result<T>) -> Void) {
        let jsonString = jsonMockFiles[jsonFileName]
        let data = jsonString?.data(using: .utf8)
        completion(MockHTTPClient.decoder.decodeData(data))
    }

}

// MARK: - Private Functions
private extension MockHTTPClient {

    /// Loads the JSON files in the project directory.
    ///
    /// - Returns: A dictionary of file names and file content.
    static func loadMockFiles() -> [String: String] {
        var mockDict = [String: String]()

        for path in Bundle.main.paths(forResourcesOfType: "json", inDirectory: nil) {
            guard let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8) else {
                continue
            }
            let name = fileName(path: path)
            mockDict[name] = jsonString
        }
        return mockDict
    }

    /// Parses the path given into the file name.
    ///
    /// - Parameter path: Path to file.
    /// - Returns: String file name.
    private static func fileName(path: String) -> String {
        var name = path.replacingOccurrences(of: Bundle.main.resourcePath ?? "", with: "")
        name = name.replacingOccurrences(of: "/", with: "")
        name = name.replacingOccurrences(of: ".json", with: "")
        return name
    }

}
