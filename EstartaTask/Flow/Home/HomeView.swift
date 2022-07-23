//
//  HomeView.swift
//  EstartaTask
//
//  Created by alaa ajoury on 23/07/2022.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ProductsListView()
            }
            .navigationBarTitle("Products")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
