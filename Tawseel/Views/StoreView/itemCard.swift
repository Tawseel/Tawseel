//
//  itemCard.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct itemCard: View {
    var item: Item
    @ObservedObject var imageLoader: ImageLoader
    @ObservedObject var cart = AppManager.Instance.cart
    
    init(item: Item) {
        self.item = item
        imageLoader = ImageLoader()
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Button(action: {cart.add(item: item)}, label: {
                Image(systemName: "plus.circle.fill")
                    .foregroundColor(.blue)
                    .imageScale(.large)
            })
            
                imageLoader.loadImage(imageUrl: item.imagePath)
                        .resizable()
                        .frame(width: 155, height: 155)
                    .cornerRadius(5)
                    Text(item.name)
                        .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct itemCard_Previews: PreviewProvider {
    static var previews: some View {
        itemCard(item: AppManager.Instance.itemModelData.items[0])
    }
}
