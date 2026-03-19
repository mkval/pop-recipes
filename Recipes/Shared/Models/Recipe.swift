//
//  Recipe.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation

struct Recipe: Codable, Identifiable {
    let id: String
    let title: String
    let origin: String
    let description: String
    let servings: Int
    let prepTime: String
    let cookTime: String
    let caloriesPerServing: Int
    let ingredients: [String]
    let instructions: [String]
    let dietaryAttributes: [String]
    let tags: [String]
    
    @LossyURL
    var photoUrlLarge: URL?
    
    @LossyURL
    var photoUrlThumbnail: URL?
}
