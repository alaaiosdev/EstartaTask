//
//  ProductService.swift
//  EstartaTask
//
//  Created by alaa ajoury on 22/07/2022.
//

import Foundation

protocol ProductService {
    func loadProducts() async throws -> ProductResponse
}
