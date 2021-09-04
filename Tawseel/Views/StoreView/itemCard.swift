//
//  itemCard.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct itemCard: View {
    @State var selected = ""
    @State var show = false
    var item: Item
    @ObservedObject var imageLoader: ImageLoader
    
    init(item: Item) {
        self.item = item
        imageLoader = ImageLoader()
    }

    
    var body: some View {
        VStack(alignment: .leading) {
        imageLoader.loadImage(imageUrl: item.imagePath)
                .resizable()
                .frame(width: 155, height: 155)
            .cornerRadius(5)
            Text(item.name)
                .font(.caption)
        }
    }
}


struct itemCard_Previews: PreviewProvider {
    static var previews: some View {
        itemCard(item: AppManager.Instance.itemModelData.items[0])
    }
}

