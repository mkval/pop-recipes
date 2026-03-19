//
//  MockAPIClient.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation

final class MockAPIClient: APIClientProtocol {
    
    func fetchRecipes() async throws -> [Recipe] {
        [.mock1, .mock2]
    }
}
