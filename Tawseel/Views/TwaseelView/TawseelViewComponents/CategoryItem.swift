//
//  CategoryItem.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import SwiftUI

struct CategoryItem: View {
    var store: StoreDetails
    @ObservedObject var  imageLoader: ImageLoader
    
    init(store: StoreDetails){
        self.store = store
        imageLoader = ImageLoader()
    
    }
        
    var body: some View {
        VStack(alignment: .leading) {
                    imageLoader.loadImage(imageUrl: store.imagePath)
                        .resizable()
                        .frame(width: 155, height: 155)
                        .cornerRadius(5)
                    Text(store.name)
                        .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryItem_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItem(store: AppManager.Instance.modelData.stores[0])
    }
}
