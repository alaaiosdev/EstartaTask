//
//  APIResponse.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import Foundation

public struct APIResponse<T> {
    public let value: T
    public let data: Data?
    public var request: URLRequest?
    public var response: URLResponse?
    public var statusCode: Int? { (response as? HTTPURLResponse)?.statusCode }

    public init(
        value: T,
        data: Data?,
        request: URLRequest?,
        response: URLResponse?
    ) {
        self.value = value
        self.data = data
        self.request = request
        self.response = response
    }
}
