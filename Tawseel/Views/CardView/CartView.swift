//
//  CardView.swift
//  Tawseel
//
//  Created by Obaida Kata on 05/05/2021.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart = AppManager.Instance.cart
    
    init() {
        let itemModel = ItemModelData()
        itemModel.items.forEach { item in
            AppManager.Instance.cart.add(item: item)
        }
    }
    
    
    var body: some View {
        if(cart.items.count > 0) {
            List {
                ForEach(cart.items) { item in
                    CartItem(item: item)
                }.onDelete(perform: { indexSet in
                    cart.delete(indexSet: indexSet)
                })
            }
        }
    }
}

struct CartItem: View  {
    @ObservedObject var imageLoader: ImageLoader
    var item: Item
    init(item: Item){
        self.imageLoader = ImageLoader()
        self.item = item
    }
    
    var body: some View {
        HStack{
            imageLoader.loadImage(imageUrl: item.imagePath)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            VStack (alignment: .leading){
                Text(item.name)
                    .font(.headline)
                Text(item.description)
                    .font(.subheadline)
            }.padding(.leading, 8)
        }
        .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CartView()
    }
}
