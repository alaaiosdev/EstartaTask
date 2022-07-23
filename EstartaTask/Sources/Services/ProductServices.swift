//
//  ProductServices.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation
import Resolver

final class APIProductServices {
    @Injected private var apiClient: APIClient
}

private extension APIProductServices {
    enum Path {
        private static let main = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default"
        static let allProducts = "\(main)/dynamodb-writer"
    }
}

extension APIProductServices: ProductService {
    func loadProducts() async throws -> ProductResponse {
        let request = RequestBuilder<ProductResponse>()
            .path(Path.allProducts)
            .method(.get)
            .build()
        
        return try await apiClient.execute(request).value
    }
}
