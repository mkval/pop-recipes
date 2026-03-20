//
//  Defaultable.swift
//  Recipes
//
//  Created by Mark Valles on 3/20/26.
//

import Foundation

protocol Defaultable: RawRepresentable {
    static var defaultValue: Self { get }
}

extension Defaultable {
    static func value(for rawValue: RawValue) -> Self {
        return Self(rawValue: rawValue) ?? Self.defaultValue
    }
}

extension Defaultable where Self.RawValue: Decodable {
    init(from decoder: Decoder) throws {
        self = Self.value(for: try decoder.singleValueContainer().decode(RawValue.self))
    }
}
