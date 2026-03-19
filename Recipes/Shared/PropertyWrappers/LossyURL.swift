//
//  LossyURL.swift
//  Recipes
//
//  Created by Mark Valles on 3/19/26.
//

import Foundation

/// A property wrapper that decodes a URL from a JSON string, and handles
/// cases where the key is missing or the value is invalid or null
/// by setting the wrapped value to nil.
///
@propertyWrapper
struct LossyURL: Codable {
    var wrappedValue: URL?
    
    init(wrappedValue: URL?) {
        self.wrappedValue = wrappedValue
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let stringValue = try? container.decode(String.self), isProperWebURL(urlString: stringValue) {
            self.wrappedValue = URL(string: stringValue)
        } else {
            self.wrappedValue = nil
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(wrappedValue?.absoluteString)
    }
    
    private func isProperWebURL(urlString: String) -> Bool {
        guard let url = URL(string: urlString),
              let scheme = url.scheme,
              let _ = url.host else { return false }
        
        return ["http", "https"].contains(scheme.lowercased())
    }
}

extension KeyedDecodingContainer {
    
    /// This handles the missing key for @LossyURL.
    func decode(_ type: LossyURL.Type, forKey key: Self.Key) throws -> LossyURL {
        return try decodeIfPresent(type, forKey: key) ?? LossyURL(wrappedValue: nil)
    }
}
