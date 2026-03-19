//
//  RecipeDetailsViewModel.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation
import Combine

final class RecipeDetailsViewModel: ObservableObject {
    
    @Published var recipe: Recipe
    
    init(recipe: Recipe) {
        self.recipe = recipe
    }
}

// MARK: - Hashable

extension RecipeDetailsViewModel: Hashable {
    static func == (lhs: RecipeDetailsViewModel, rhs: RecipeDetailsViewModel) -> Bool {
        lhs.recipe.id == rhs.recipe.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(recipe.id)
    }
}
