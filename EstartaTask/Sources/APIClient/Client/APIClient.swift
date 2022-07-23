//
//  APIClient.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import Foundation
import Alamofire

protocol APIClient: AnyObject {
    var configuration: APIConfiguration { get }
    func execute<Request: APIRequest>(_ request: Request) async throws -> APIResponse<Request.Response>
}

final class DefaultAPIClient {
    public let configuration: APIConfiguration
    private let session: Session
    private var interceptor: Interceptor?
    
    public init(
        configuration: APIConfiguration,
        @InterceptorBuilder interceptors: @escaping (APIClient) -> [RequestInterceptor]
    ) {
        self.configuration = configuration
        self.session = Session(configuration: configuration.urlSessionConfiguration)
        self.interceptor = Interceptor(interceptors: interceptors(self))
    }
}

extension DefaultAPIClient {
    @resultBuilder
    enum InterceptorBuilder {
        public static func buildBlock(_ interceptors: RequestInterceptor...) -> [RequestInterceptor] {
            interceptors
        }
    }
}

extension DefaultAPIClient: APIClient {
    public func execute<Request: APIRequest>(_ request: Request) async throws -> APIResponse<Request.Response> {
        let response = await makeDataRequest(from: request)
            .validate()
            .serializingDecodable(Request.Response.self)
            .response
        
        return APIResponse(
            value: try response.result.get(),
            data: response.data,
            request: response.request,
            response: response.response
        )
    }
    
    private func makeDataRequest<Request: APIRequest>(from request: Request) -> DataRequest {
        let urlRequest = request.urlRequest(for: configuration)
        return session.request(urlRequest, interceptor: interceptor)
    }
}
