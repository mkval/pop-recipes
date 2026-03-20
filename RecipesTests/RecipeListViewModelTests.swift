//
//  RecipeListViewModelTests.swift
//  RecipesTests
//
//  Created by Mark Valles on 3/19/26.
//

import XCTest

@testable import Recipes

// TODO Test search and filter logic

@MainActor
final class RecipeListViewModelTests: XCTestCase {
    
    var sut: RecipeListViewModel!
    var mockAPIClient: MockAPIClient!

    override func setUpWithError() throws {
        self.mockAPIClient = MockAPIClient()
        self.sut = RecipeListViewModel(apiClient: self.mockAPIClient)
    }

    override func tearDownWithError() throws {
        //
    }

    func test_fetchRecipes_callsAPIClient() async throws {
        await self.sut.fetchData()
        let expectedResult = try await self.mockAPIClient.fetchRecipes()
        
        XCTAssertEqual(self.sut.recipes.count, expectedResult.count)
        XCTAssertEqual(self.sut.recipes.first?.id, expectedResult.first?.id)
    }

}
