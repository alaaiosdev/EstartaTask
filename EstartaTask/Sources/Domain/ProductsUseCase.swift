//
//  ProductsUseCase.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation
import Resolver

protocol ProductsUseCase {
    func loadProducts() async throws -> ProductResponse
}

struct DefaultProductsUseCase: ProductsUseCase {
    @Injected private var service: ProductService
}

extension DefaultProductsUseCase {
    func loadProducts() async throws -> ProductResponse {
        try await service.loadProducts()
    }
}
