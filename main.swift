//
//  main.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import SwiftUI

#if DEBUG
if ProcessInfo.processInfo.environment["IS_UNIT_TESTING"] == "1" {
    TestApp.main()
} else {
    RecipesApp.main()
}
#else
RecipesApp.main()
#endif
