//
//  APIConfiguration.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.

import Foundation

struct APIConfiguration {
    public let url: URL
    public let requestTimeoutInterval: TimeInterval
    public let urlSessionConfiguration: URLSessionConfiguration
    
    public init(
        url string: String,
        requestTimeoutInterval: TimeInterval,
        urlSessionConfiguration: URLSessionConfiguration
    ) {
        guard let url = URL(string: string) else {
            fatalError("Invalid url: \(string)")
        }

        self.url = url
        self.requestTimeoutInterval = requestTimeoutInterval
        self.urlSessionConfiguration = urlSessionConfiguration
        self.urlSessionConfiguration.timeoutIntervalForRequest = requestTimeoutInterval
        self.urlSessionConfiguration.timeoutIntervalForResource = requestTimeoutInterval
    }
}
