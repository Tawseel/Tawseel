//
//  ItemCategoryRow.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct ItemCategoryRow: View {
    var categoryName: String
    var items: [Item]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(items) { item in
                        NavigationLink(destination: ItemView(item: item)) {
                            itemCard(item: item)
                        }
                    }
                }
            }
        }
    }
}

struct ItemCategoryRow_Previews: PreviewProvider {
    static var items = AppManager.Instance.itemModelData.items
    
    static var previews: some View {
        ItemCategoryRow(categoryName: items[0].category, items: items)
    }
}
