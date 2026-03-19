//
//  MockRecipe.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation

extension Recipe {
    static var mock1: Recipe {
        let jsonString = """
            {
              "id": "RECIPE_016",
              "title": "Chicken Adobo",
              "origin": "Philippines",
              "description": "Savory, tangy chicken braised in soy sauce, vinegar, and garlic.",
              "servings": 4,
              "prep_time": "10 mins",
              "cook_time": "40 mins",
              "calories_per_serving": 380,
              "ingredients": [
                "1kg chicken thighs",
                "1/2 cup soy sauce",
                "1/3 cup cane vinegar",
                "6 cloves garlic, crushed",
                "3 bay leaves",
                "1 tsp peppercorns"
              ],
              "instructions": [
                "Combine all ingredients in a pot and marinate for 30 minutes.",
                "Bring to a boil, then lower heat and simmer for 30 minutes.",
                "Optional: Sear chicken for crispy skin before returning to sauce.",
                "Reduce sauce until thickened and serve over rice."
              ],
              "dietary_attributes": [
                "Dairy-Free",
                "Nut-Free"
              ],
              "tags": [
                "Filipino",
                "Chicken",
                "Savory",
                "Dinner",
                "Comfort Food"
              ],
              "photo_url_large": "https://images.unsplash.com/photo-1624462966581-bc6d768cbce5?auto=format&fit=crop&w=800&q=80",
              "photo_url_thumbnail": "https://images.unsplash.com/photo-1624462966581-bc6d768cbce5?auto=format&fit=crop&w=100&h=100&q=80"
            }           
            """
        
        let data = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! decoder.decode(Recipe.self, from: data)
    }
    
    static var mock2: Recipe {
        let jsonString = """
            {
              "id": "RECIPE_002",
              "title": "Thai Green Curry",
              "origin": "Thailand",
              "description": "A fragrant, spicy, and creamy curry featuring coconut milk and fresh herbs.",
              "servings": 4,
              "prep_time": "15 mins",
              "cook_time": "20 mins",
              "calories_per_serving": 450,
              "ingredients": [
                "2 tbsp green curry paste",
                "400ml coconut milk",
                "500g chicken breast, sliced",
                "2 tbsp fish sauce",
                "1 tbsp palm sugar",
                "100g bamboo shoots",
                "Handful of Thai basil"
              ],
              "instructions": [
                "Fry the curry paste in 2 tbsp of coconut cream until fragrant.",
                "Add chicken and stir-fry until opaque.",
                "Pour in the remaining coconut milk and bring to a simmer.",
                "Add bamboo shoots, fish sauce, and sugar.",
                "Simmer for 10 minutes, then stir in Thai basil."
              ],
              "dietary_attributes": [
                "Gluten-Free"
              ],
              "tags": [
                "Thai",
                "Curry",
                "Spicy",
                "Coconut",
                "Asian"
              ],
              "photo_url_large": "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?auto=format&fit=crop&w=800&q=80",
              "photo_url_thumbnail": "https://images.unsplash.com/photo-1455619452474-d2be8b1e70cd?auto=format&fit=crop&w=100&h=100&q=80"
            }            
            """
        
        let data = jsonString.data(using: .utf8)!
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try! decoder.decode(Recipe.self, from: data)
    }
}
