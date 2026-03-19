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
