//
//  MockHTTPClient.swift
//  TheWing
//
//  Created by Jonathan Samudio on 3/7/18.
//  Copyright © 2018 Prolific Interactive. All rights reserved.
//

import Alamofire

/// Mock http client handles mocks json requests.
open class MockHTTPClient {

	// MARK: - Private Properties

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

    private static func fileName(path: String) -> String {
        var name = path.replacingOccurrences(of: Bundle.main.resourcePath ?? "", with: "")
        name = name.replacingOccurrences(of: "/", with: "")
        name = name.replacingOccurrences(of: ".json", with: "")
        return name
    }

}
