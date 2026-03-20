//
//  RecipeListView.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var viewModel: RecipeListViewModel
    
    @State private var path = NavigationPath()
    @State private var showFilterSheet = false
    
    var body: some View {
        NavigationStack(path: $path) {
            
            SearchBarView(
                text: $viewModel.searchText,
                onFilterTap: {
                    showFilterSheet = true
                }
            )
            
            List(self.viewModel.filteredRecipes) { recipe in
                RecipeCardView(recipe: recipe)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.path.append(RecipeDetailsViewModel(recipe: recipe))
                    }
            }
            .listStyle(.plain)
            .task {
                await viewModel.fetchData()
            }
            .navigationTitle("Recipes")
            
            .navigationDestination(for: RecipeDetailsViewModel.self, destination: { viewModel in
                RecipeDetailsView(viewModel: viewModel, path: $path)
            })
        }
        
        .sheet(isPresented: $showFilterSheet) {
            RecipeFilterView(selectedDietaryAttributes: $viewModel.selectedDietaryAttributes)
                .presentationDetents([.medium])
        }
        
        .scrollDismissesKeyboard(.interactively)
    }
}

#Preview {
    RecipeListView(viewModel: RecipeListViewModel(apiClient: MockAPIClient()))
}
