//
//  APIRequest.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import Foundation

// MARK: - APIRequest

public protocol APIRequest {
    associatedtype Response: Decodable
    
    var path: String { get }
    var method: HTTPMethod { get }
}

extension APIRequest {
    func urlRequest(for configuration: APIConfiguration) -> URLRequest {
        
        var urlRequest = URLRequest(url: URL(string: path)!)
        urlRequest.httpMethod = method.rawValue
        urlRequest.timeoutInterval = configuration.requestTimeoutInterval
        return urlRequest
    }
}
