//
//  RecipesApp.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import SwiftUI

struct RecipesApp: App {
    
    let apiClient = APIClient()
    
    var body: some Scene {
        WindowGroup {
            RecipeListView(viewModel: RecipeListViewModel(apiClient: self.apiClient))
        }
    }
}
