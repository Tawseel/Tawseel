//
//  ContentView.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
    

    
    var body: some View {
        NavigationView {
//            ItemView(item: Item(id: 3, name: "Burger", description: "vfvfvdffvdf", price: 50, category: "Burger", storeID: 3, ingredients: ingredients, imagePath: "steak"))
            SignInView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
