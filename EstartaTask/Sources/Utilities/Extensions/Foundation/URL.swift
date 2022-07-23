//
//  URL.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation

public extension URL {
    func appendingQueryItems(_ contentsOf: [String: Any?]) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString), !contentsOf.isEmpty else {
            return self
        }

        let keys = contentsOf.keys.map { $0.lowercased() }

        urlComponents.queryItems = urlComponents.queryItems?
            .filter { !keys.contains($0.name.lowercased()) } ?? []

        urlComponents.queryItems?.append(contentsOf: contentsOf.compactMap {
            guard let value = $0.value else { return nil }
            return URLQueryItem(name: $0.key, value: "\(value)")
        })

        return urlComponents.url ?? self
    }
}
