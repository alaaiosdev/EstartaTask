//
//  ProductDetailsView.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import SwiftUI

struct ProductDetailsView: View {
    
    enum Constant {
        static let price = "Price:"
        static let createdAt = "Created at:"
        static let uid = "UID:"
    }
    
    var productItem: Product?
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: productItem?.imageUrls.first ?? "")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                    
                } placeholder: {
                    
                    ZStack {
                        Image(systemName: "photo.artframe")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                            .foregroundColor(.white.opacity(0.7))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                            .scaleEffect(2)
                            .frame(width: 160, height: 217, alignment: .center)
                    }
                }
                .frame(height: 300)
                
                VStack(spacing: 10) {
                    Spacer()
                    Text(productItem?.name ?? "")
                        .font(.largeTitle).bold()
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color(hue: 1.0, saturation: 0.138, brightness: 0.109))
                        .frame(maxWidth: 336, alignment: .leading)
                    
                    Text("\(Constant.price) \(productItem?.price ?? "")")
                        .font(.title3.bold())
                        .foregroundColor(Color(hue: 0.0, saturation: 0.018, brightness: 0.343))
                        .frame(maxWidth: 336, alignment: .leading)
                    
                    Text("\(Constant.createdAt) \(productItem?.createdAt ?? "")")
                        .font(.title3.bold())
                        .foregroundColor(Color(hue: 0.0, saturation: 0.018, brightness: 0.343))
                        .frame(maxWidth: 336, alignment: .leading)
                    
                    Text("\(Constant.uid) \(productItem?.uid ?? "")")
                        .font(.title3.bold())
                        .foregroundColor(Color(hue: 0.0, saturation: 0.018, brightness: 0.343))
                        .frame(maxWidth: 336, alignment: .leading)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea(.container, edges: .top)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailsView()
    }
}
