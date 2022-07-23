//
//  AppError.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation

public struct AppError: Error {
    public let message: String?
    public let code: Int?

    public init(message: String?, code: Int? = nil) {
        self.message = message
        self.code = code
    }
}

extension AppError: LocalizedError {
    public var errorDescription: String? { message }
    public var failureReason: String? { message }
}

extension AppError: Equatable, Hashable {}
