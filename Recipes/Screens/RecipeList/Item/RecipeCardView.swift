//
//  RecipeCardView.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import SwiftUI

struct RecipeCardView: View {
    
    @State var recipe: Recipe
    
    @State private var isThumbnailLoaded = false
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            self.thumbnailView()
            self.detailView()
        }
        .padding(.vertical, 4)
    }
    
    @ViewBuilder
    private func thumbnailView() -> some View {
        AsyncImage(url: recipe.photoUrlThumbnail) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .onAppear {
                        withAnimation(.easeIn(duration: 0.8)) {
                            isThumbnailLoaded = true
                        }
                    }
                    .opacity(isThumbnailLoaded ? 1 : 0)
                    .scaleEffect(isThumbnailLoaded ? 1 : 1.1)
            } else if phase.error != nil {
                ZStack {
                    Color.gray.opacity(0.3)
                    
                    Image(systemName: "photo.fill")
                        .symbolVariant(.slash)
                        .font(Font.system(size: 24))
                        .foregroundColor(.white)
                }
            } else {
                Color.gray.opacity(0.3)
            }
        }
        .frame(width: 50, height: 50)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .animation(.easeOut(duration: 0.5), value: recipe.photoUrlThumbnail)
    }
    
    @ViewBuilder
    private func detailView() -> some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(recipe.title)
                .font(.headline)
                .fontWeight(.bold)
            
            Text(recipe.description)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
            
            HStack {
                ForEach(recipe.tags.prefix(3), id: \.self) { tag in
                    Text(tag)
                        .font(.system(size: 10, weight: .medium))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.blue.opacity(0.1))
                        .foregroundColor(.blue)
                        .cornerRadius(4)
                }
            }
            .padding(.top, 2)
        }
    }
}

#Preview {
    RecipeCardView(recipe: .mock1)
}
