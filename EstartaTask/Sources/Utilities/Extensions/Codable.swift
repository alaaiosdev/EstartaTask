//
//  Codable.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation

public typealias JSONDictionary = [String: Any]

public extension Data {
    func decoded<T: Decodable>() throws -> T {
        try JSONDecoder().decode(T.self, from: self)
    }
        
    var json: JSONDictionary {
        guard
            let jsonObject = try? JSONSerialization.jsonObject(with: self, options: .allowFragments),
            let jsonDictionary = jsonObject as? JSONDictionary
        else {
            return [:]
        }
        return jsonDictionary
    }
}

public extension Encodable {
    func encoded() throws -> Data {
        try JSONEncoder().encode(self)
    }
}
