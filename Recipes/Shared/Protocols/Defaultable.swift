//
//  Defaultable.swift
//  Recipes
//
//  Created by Mark Valles on 3/20/26.
//

import Foundation

/// Decodable types conforming to this protocol are able to continue with the decoding process
/// without being halted by a DecodingError.
///
/// For example, in the case of an Enum type, Swift throws a DecodingError when decoding
/// from a raw value that doesn't map to one of its cases.
///
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
