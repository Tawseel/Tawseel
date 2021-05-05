//
//  ItemModelData.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import Foundation


final class ItemModelData: ObservableObject {
    @Published var items: [Item] = load("items.json")

    var categories: [String: [Item]] {
        Dictionary(
            grouping: items,
            by: { $0.category }
        )
    }
}
