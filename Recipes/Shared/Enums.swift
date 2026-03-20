//
//  Enums.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation

enum JSONFileDecodingError: Swift.Error {
    case pathNotFound(String)
    case fileURLUnreadable(URL)
}

enum DietaryAttribute: String, Codable, Defaultable, CaseIterable, Identifiable {
    case containsDairy = "Contains Dairy"
    case containsGluten = "Contains Gluten"
    case dairyFree = "Dairy-Free"
    case glutenFree = "Gluten-Free"
    case nutFree = "Nut-Free"
    case vegan = "Vegan"
    case vegetarian = "Vegetarian"
    
    case unknown
    
    static var defaultValue: DietaryAttribute = .unknown
    
    var id: String { rawValue }
}
