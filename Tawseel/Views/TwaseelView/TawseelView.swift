//
//  StoreHome.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import SwiftUI


struct TawseelView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            CartView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Cart")
                }
            PurchaseHistoryView()
                .tabItem {
                    Image(systemName: "cube.box")
                    Text("Cart")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
        .navigationBarTitle("Tawssel", displayMode: .inline)
    }
    
}

struct StoreHome_Previews: PreviewProvider {
    static var previews: some View {
        TawseelView()
    }
}
