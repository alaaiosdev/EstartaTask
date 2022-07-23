//
//  ProductsListViewModel.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import SwiftUI
import Resolver

final class ProductsListViewModel: ObservableObject {
    
    @Injected private var useCase: ProductsUseCase
    @Published var errorMessage: String = ""
    @Published private(set) var loadingState: LoadingState = .idle
    @Published var products: [Product] = []
    
    init() {
        onAppear()
    }
}

private extension ProductsListViewModel {
    func onAppear() {
        loadProducts()
    }
    
    func loadProducts() {
        
        Task { @MainActor in
            do {
                
                loadingState = .loading
                let response = try await useCase.loadProducts()
                self.products = response.results
                
            } catch {
                errorMessage = error.localizedDescription
            }
            loadingState = .idle
        }
    }
}
