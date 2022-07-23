//
//  ProductsListView.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import SwiftUI
import Combine
import ProgressHUD

struct ProductsListView: View {
    
    @ObservedObject var viewModel = ProductsListViewModel()
    private var cancellable = Set<AnyCancellable>()
    
    var body: some View {
        
        ZStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 160), spacing: 15)], spacing: 15) {
                
                ForEach(viewModel.products) { product in
                    NavigationLink(destination: ProductDetailsView(productItem: product)) {
                        
                        ProductCard(productItem: product)
                    }
                }
            }
        }
    }
}

struct ProductsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductsListView()
    }
}
