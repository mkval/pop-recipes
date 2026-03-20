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
    @Published var searchText: String = ""
    @Published var selectedDietaryAttributes: Set<DietaryAttribute> = []
    
    @Published private(set) var debouncedText: String = ""
    
    private let apiClient: APIClientProtocol
    
    private var cancellables = Set<AnyCancellable>()
    
    init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
        
        $searchText
            .debounce(for: .milliseconds(400), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .sink { [weak self] value in
                self?.debouncedText = value
            }
            .store(in: &cancellables)
    }
    
    func fetchData() async {
        do {
            self.recipes = try await self.apiClient.fetchRecipes()
        } catch {
            
        }
    }
    
    
}

extension RecipeListViewModel {
    var filteredRecipes: [Recipe] {
        recipes
            .filter {
                debouncedText.isEmpty ||
                $0.title.localizedCaseInsensitiveContains(debouncedText) ||
                $0.hasTagMatching(text: debouncedText)
            }
            .filter { recipe in
                selectedDietaryAttributes.isEmpty ||
                !Set(recipe.dietaryAttributes).isDisjoint(with: selectedDietaryAttributes)
            }
    }
}

private extension Recipe {
    func hasTagMatching(text: String) -> Bool {
        tags.filter { $0.localizedCaseInsensitiveContains(text) }.count > 0
    }
}
