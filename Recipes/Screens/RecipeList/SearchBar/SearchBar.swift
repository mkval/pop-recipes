//
//  SearchBar.swift
//  Recipes
//
//  Created by Mark Valles on 3/20/26.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    
    var onFilterTap: () -> Void
    
    var body: some View {
        HStack(spacing: 10) {
            
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search", text: $text)
                
                // Only show the Clear button once we have content in the textField.
                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding(10)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            Button(action: onFilterTap) {
                Image(systemName: "slider.horizontal.3")
                    .font(.system(size: 18, weight: .semibold))
                    .padding(10)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    SearchBarView(text: .constant(""), onFilterTap: {
        
    })
}
