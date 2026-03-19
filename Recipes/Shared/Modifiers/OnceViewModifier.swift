//
//  OnceViewModifier.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import SwiftUI

struct OnceViewModifier: ViewModifier {
    @State private var hasAppeared = false
    let action: () -> Void

    func body(content: Content) -> some View {
        content.onAppear {
            if !hasAppeared {
                action()
                hasAppeared = true
            }
        }
    }
}

extension View {

    /// This modifier calls its action closure only once.
    func onViewLoaded(perform action: @escaping () -> Void) -> some View {
        self.modifier(OnceViewModifier(action: action))
    }
}
