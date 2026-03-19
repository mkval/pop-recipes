//
//  RecipeDetailsView.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    @StateObject var viewModel: RecipeDetailsViewModel
    
    @Binding var path: NavigationPath
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                self.imageView()
                self.detailsView()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
    
    @State private var isLoaded = false
    
    @ViewBuilder
    private func detailsView() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.recipe.origin.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                Text(viewModel.recipe.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }

            HStack(spacing: 20) {
                Label("\(viewModel.recipe.servings) servings", systemImage: "person.2")
                Label(viewModel.recipe.cookTime, systemImage: "timer")
            }
            .font(.subheadline)
            .foregroundColor(.secondary)

            Divider()

            Text(viewModel.recipe.description)
                .font(.body)
                .lineSpacing(4)

            HStack {
                ForEach(viewModel.recipe.dietaryAttributes, id: \.self) { attr in
                    Text(attr)
                        .font(.caption2)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .background(Color.green.opacity(0.1))
                        .foregroundColor(.green)
                        .clipShape(Capsule())
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                Text("Ingredients")
                    .font(.headline)
                
                ForEach(viewModel.recipe.ingredients, id: \.self) { ingredient in
                    HStack(alignment: .top) {
                        Image(systemName: "circle.fill")
                            .font(.system(size: 6))
                            .padding(.top, 8)
                        Text(ingredient)
                    }
                }
            }
            .padding(.top, 10)

            VStack(alignment: .leading, spacing: 12) {
                Text("Instructions")
                    .font(.headline)
                
                ForEach(Array(viewModel.recipe.instructions.enumerated()), id: \.offset) { index, step in
                    HStack(alignment: .top, spacing: 12) {
                        Text("\(index + 1)")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .frame(width: 24, height: 24)
                            .background(Color.blue)
                            .clipShape(Circle())
                        
                        Text(step)
                            .font(.body)
                    }
                }
            }
            .padding(.top, 10)
        }
        .padding(.horizontal, 24)
        .padding(.bottom, 40)
    }
    
    @ViewBuilder
    private func imageView() -> some View {
        AsyncImage(url: viewModel.recipe.photoUrlLarge) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .onAppear {
                        withAnimation(.easeOut(duration: 0.4)) {
                            isLoaded = true
                        }
                    }
                    .opacity(isLoaded ? 1 : 0)
                    .scaleEffect(isLoaded ? 1 : 1.1)
            } else if phase.error != nil {
                ZStack {
                    Color.gray.opacity(0.3)
                    Image(systemName: "photo.on.rectangle.angled")
                        .symbolVariant(.slash)
                        .font(Font.system(size: 50))
                        .foregroundColor(.white)
                        .padding(.top, 60)
                }
                .frame(height: 300)
            } else {
                ZStack {
                    Color.gray.opacity(0.3)
                        .frame(height: 300)
                    
                    Rectangle()
                        .foregroundColor(.gray.opacity(0.2))
                        .overlay(
                            ProgressView()
                                .scaleEffect(1.2)
                                .padding(.top, 60)
                        )
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 300)
        .clipped()
        .animation(.easeOut(duration: 0.5), value: viewModel.recipe.photoUrlThumbnail)
    }
}

#Preview {
    RecipeDetailsView(
        viewModel: RecipeDetailsViewModel(recipe: .mock2),
        path: .constant(.init())
    )
}
