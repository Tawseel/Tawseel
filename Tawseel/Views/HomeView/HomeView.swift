//
//  HomeView.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct HomeView: View {
    private var modelData = AppManager.Instance.modelData
    @ObservedObject private var  imageLoader: ImageLoader
    
    init(){
        imageLoader = ImageLoader()
    }
    
    var body: some View {
        VStack {
            List {
//                imageLoader.loadImage(imageUrl: modelData.features[0].imagePath)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: 200)
//                    .clipped()
//                    .listRowInsets(EdgeInsets())
                Text("\(modelData.stores.capacity)")
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, storesDetails: modelData.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
            }
            .navigationTitle("Tawseel")
        }
        .onAppear(perform: {
            modelData.loadStores()
        })
    }
}

struct HomeView_Previews: PreviewProvider {
    
    static var previews: some View {
        HomeView()
    }
}
