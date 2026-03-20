//
//  RecipeFilterView.swift
//  Recipes
//
//  Created by Mark Valles on 3/20/26.
//

import SwiftUI

struct RecipeFilterView: View {
    @Binding var selectedDietaryAttributes: Set<DietaryAttribute>
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Filter by Dietary Preferences")
                .font(.headline)
            
            VStack(spacing: 2) {
                ForEach(DietaryAttribute.allCases.filter { $0 != .unknown }) { tag in
                    HStack {
                        if selectedDietaryAttributes.contains(tag) {
                            Image(systemName: "checkmark.square.fill")
                                .foregroundColor(.blue)
                        } else {
                            Image(systemName: "square")
                                .foregroundColor(.blue)
                        }
                        
                        Text(tag.rawValue.capitalized)
                        
                        Spacer()
                    }
                    .padding(.vertical, 5)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        if selectedDietaryAttributes.contains(tag) {
                            selectedDietaryAttributes.remove(tag)
                        } else {
                            selectedDietaryAttributes.insert(tag)
                        }
                    }
                }
            }
            
            Divider()
            
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Button("Clear All") {
                        selectedDietaryAttributes.removeAll()
                    }
                    .disabled(selectedDietaryAttributes.isEmpty)
                    .frame(maxWidth: .infinity)
                    .padding(8)
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 32)
        .padding(.top, 32)
    }
}

#Preview {
    RecipeFilterView(selectedDietaryAttributes: .constant([]))
}
