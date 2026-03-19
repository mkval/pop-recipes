//
//  APIClient.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation

protocol APIClientProtocol {
    func fetchRecipes() async throws -> [Recipe]
}

final class APIClient: APIClientProtocol {
    static var shared = APIClient()
    
    private let jsonDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        decoder.dateDecodingStrategy = .iso8601
        return decoder
    }()
    
    func fetchRecipes() async throws -> [Recipe] {
        let fileName = "recipes"
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        var jsonData: Data!
        
        do {
            jsonData = try Helpers.jsonDataFromFile(fileName)
        } catch JSONFileDecodingError.pathNotFound(let path) {
            print("❌ JSON file at path '\(path)' not found")
        } catch JSONFileDecodingError.fileURLUnreadable(let url) {
            print("❌ JSON file at URL '\(url)' is unreadable")
        } catch {
            throw error
        }
        
        do {
            let response = try jsonDecoder.decode([String: [Recipe]].self, from: jsonData)
            return response["international_recipes"] ?? []
        } catch {
            print("Failed to decode JSON: \(error)")
        }
        return []
    }
}
