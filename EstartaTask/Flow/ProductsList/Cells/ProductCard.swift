//
//  ProductItem.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import SwiftUI

struct ProductCard: View {
    
    enum Constant {
        static let price = "Price:"
    }
    
    var productItem: Product?
    
    var body: some View {
        
        AsyncImage(url: URL(string: productItem?.imageUrls.first ?? "")) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .overlay(alignment: .bottom) {
                    VStack {
                        Text(productItem?.name ?? "")
                            .font(.headline)
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136, alignment: .leading)
                        
                        Text("\(Constant.price) \(productItem?.price ?? "")")
                            .font(.caption.bold())
                            .foregroundColor(.white)
                            .shadow(color: .black, radius: 3, x: 0, y: 0)
                            .frame(maxWidth: 136, alignment: .leading)
                        
                    }.padding()
                }
        } placeholder: {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(1.5)
                .frame(width: 160, height: 217, alignment: .center)
        }
        .frame(width: 160, height: 217, alignment: .top)
        .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: Color.black.opacity(0.3), radius: 15, x: 0, y: 10)
    }
}

struct ProductItem_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(productItem: nil)
    }
}
