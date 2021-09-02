//
//  Order.swift
//  Tawseel
//
//  Created by obaida kata on 31/08/2021.
//

import Foundation

class Order: Hashable, ObservableObject{
    static func == (lhs: Order, rhs: Order) -> Bool {
        return lhs.values == rhs.values
    }

    @Published var values : [String: String] = [:]
    @Published var item : Item
    
    init(item: Item) {
        self.item = item
    }
    
    func print() {
        for (key, value) in values.sorted(by: { (key1, key2) in
            return key1 > key2
        }) {
            Swift.print("key: \(key), value: \(value)")
        }
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(item.id)
    }
}


struct OrderRequest: Encodable {
    var values : [CardOrderValue]
    let item : Item
    
    init(order: Order) {
        self.item = order.item
        self.values = []
        for(key, value) in order.values {
            self.values.append(CardOrderValue(key: key, value: value))
        }
    }
}

struct CardOrderValue: Encodable {
    var key: String
    var value: String
}
