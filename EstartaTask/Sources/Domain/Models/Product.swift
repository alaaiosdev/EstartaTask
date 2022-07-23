//
//  Product.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation

// MARK: - ProductResponse
struct ProductResponse: Decodable {
    let results: [Product]
    let pagination: Pagination
}

// MARK: - Pagination
struct Pagination: Decodable {
    let key: JSONNull?
}

// MARK: - Brand
struct Product: Identifiable, Decodable {
    var id = UUID()
    
    let createdAt, price, name, uid: String
    let imageIDS: [String]
    let imageUrls, imageUrlsThumbnails: [String]
    
    enum CodingKeys: String, CodingKey {
        case createdAt = "created_at"
        case price, name, uid
        case imageIDS = "image_ids"
        case imageUrls = "image_urls"
        case imageUrlsThumbnails = "image_urls_thumbnails"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
