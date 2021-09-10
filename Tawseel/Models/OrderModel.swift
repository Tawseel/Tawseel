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

    @Published var order : Order
    
    init(item: Item) {
        self.order = Order(values: [], item: item)
    }
    
    func reset() {
        self.order.values = []
    }
    
    
    public func setValue(title: String, value: String) {
        self.order.setValue(title: title, value: value)
    }
    
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(order.item.id)
    }
}

public struct Order: Encodable, Equatable, Hashable, Decodable{
    var values : [CardOrderValue]
    let item : Item
    var status = OrderStatus.New
    var dateTime = ""
    
    mutating func setValue(title: String, value: String) {
        var isExist = false
        
        for i in 0..<values.count {
            if(values[i].ingredientName == title) {
                values[i].ingredientValue = value
                isExist = true
                break
            }
        }
        
        if(!isExist) {
            values.append(CardOrderValue(ingredientName: title, ingredientValue: value))
        }
    }
}

enum OrderStatus: String, Codable {
    case New
    case Accepted
    case Ready
    case OnWay
    case Delivered
}

struct CardOrderValue: Encodable, Equatable, Comparable, Hashable, Decodable {
    static func < (lhs: CardOrderValue, rhs: CardOrderValue) -> Bool {
        return lhs.ingredientName.count < rhs.ingredientName.count
    }
    
    var ingredientName: String
    var ingredientValue: String
}
