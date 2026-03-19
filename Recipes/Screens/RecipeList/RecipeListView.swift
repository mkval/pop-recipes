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
    
    var body: some View {
        NavigationStack(path: $path) {
            List(self.viewModel.recipes) { recipe in
                RecipeCardView(recipe: recipe)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.path.append(RecipeDetailsViewModel(recipe: recipe))
                    }
            }
            .task {
                await viewModel.fetchData()
            }
            .navigationTitle("Global Recipes")
            
            .navigationDestination(for: RecipeDetailsViewModel.self, destination: { viewModel in
                RecipeDetailsView(viewModel: viewModel, path: $path)
            })
        }
    }
}

#Preview {
    RecipeListView(viewModel: RecipeListViewModel(apiClient: MockAPIClient()))
}
