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
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }     
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Tawssel", displayMode: .inline)
    }
    
}

struct StoreHome_Previews: PreviewProvider {
    static var previews: some View {
        TawseelView()
    }
}
