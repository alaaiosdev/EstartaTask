//
//  PaginatorResponse.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import Foundation

public struct PagniatorResponse<T: Decodable>: Decodable {
    private let data: T?
    private let statusCode: Int?
    private let message: String?
    private let timestamp: String?
    
    init(
        data: T?,
        statusCode: Int?,
        message: String?,
        timestamp: String?
    ) {
        self.data = data
        self.statusCode = statusCode
        self.message = message
        self.timestamp = timestamp
    }
    
    func unwrap() throws -> T {
        guard let data = data else {
            throw AppError(message: message, code: statusCode)
        }
        
        return data
    }
}
