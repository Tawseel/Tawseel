//
//  CategoryRow.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var storesDetails: [StoreDetails]
    var body: some View {
        VStack(alignment: .leading) {
            Text(categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(storesDetails) { storeDetails in
                        NavigationLink(destination: StoreView(storeDetails: storeDetails)) {
                            CategoryItem(store: storeDetails)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var stores = AppManager.Instance.modelData.stores
    
    static var previews: some View {
        CategoryRow(categoryName: stores[0].category.rawValue, storesDetails: Array(stores.prefix(3)))
    }
}
