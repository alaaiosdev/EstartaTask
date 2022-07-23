//
//  RequestBuilder.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import Foundation

public struct Request<Response: Decodable>: APIRequest {
    public let path: String
    public let method: HTTPMethod
}

public final class RequestBuilder<Response: Decodable> {
    private var path: String = ""
    private var method: HTTPMethod = .get
    
    public init() {}

    @discardableResult
    public func path(_ path: String) -> Self {
        self.path = path
        return self
    }

    @discardableResult
    public func method(_ method: HTTPMethod) -> Self {
        self.method = method
        return self
    }
    
    public func build() -> Request<Response> {
        .init(
            path: path,
            method: method
        )
    }
}
