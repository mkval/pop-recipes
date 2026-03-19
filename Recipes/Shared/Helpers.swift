//
//  Helpers.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation

struct Helpers {
    static func jsonDataFromFile(_ name: String, bundle: Bundle = Bundle.main) throws -> Data {
        guard let path = bundle.path(forResource: name, ofType: "json") else {
            throw JSONFileDecodingError.pathNotFound("./\(name).json")
        }
        do {
            return try Data(contentsOf: URL(fileURLWithPath: path))
        } catch {
            throw JSONFileDecodingError.fileURLUnreadable(URL(fileURLWithPath: path))
        }
    }
}
