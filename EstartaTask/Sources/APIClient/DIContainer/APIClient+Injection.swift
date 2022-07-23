//
//  APIClient+Injection.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import Foundation
import Alamofire
import Resolver

private extension Resolver {
    static var apiURL: String = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com"
    static var requestTimeoutInterval = 30.0
}

private extension Resolver {
    static func registerAPIConfiguration() {
        register(APIConfiguration.self) {
            .init(
                url: apiURL,
                requestTimeoutInterval: requestTimeoutInterval,
                urlSessionConfiguration: .af.default
            )
        }
    }
}

extension Resolver {
    static func registerAPIClient(
        @DefaultAPIClient.InterceptorBuilder interceptors: @escaping (APIClient) -> [RequestInterceptor]
    ) {
        registerAPIConfiguration()
        register(APIClient.self) {
            DefaultAPIClient(configuration: resolve(), interceptors: interceptors)
        }
    }
}
