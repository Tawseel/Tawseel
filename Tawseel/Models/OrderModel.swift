//
//  Order.swift
//  Tawseel
//
//  Created by obaida kata on 31/08/2021.
//

import Foundation

class OrderModel: Hashable, ObservableObject{
    static func == (lhs: OrderModel, rhs: OrderModel) -> Bool {
        return lhs.order.values == rhs.order.values
    }

//    @Published var values : [String: String] = [:]
//    @Published var item : Item
    @Published var order : Order
    
    init(item: Item) {
        self.order = Order(values: [], item: item)
    }
    
    
    public func setValue(title: String, value: String) {
        self.order.values.append(CardOrderValue(ingredientName: title, ingredientValue: value))
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(order.item.id)
    }
}

struct Order: Encodable, Equatable, Hashable{
    var values : [CardOrderValue]
    let item : Item
}

struct CardOrderValue: Encodable, Equatable, Comparable, Hashable {
    static func < (lhs: CardOrderValue, rhs: CardOrderValue) -> Bool {
        return lhs.ingredientName.count < rhs.ingredientName.count
    }
    
    var ingredientName: String
    var ingredientValue: String
}
