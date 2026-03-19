//
//  RecipeListViewModel.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import SwiftUI
import Combine

final class RecipeListViewModel: ObservableObject {
    
    @Published var recipes: [Recipe] = []
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    func fetchData() async {
        do {
            self.recipes = try await self.apiClient.fetchRecipes()
        } catch {
            
        }
    }
}
