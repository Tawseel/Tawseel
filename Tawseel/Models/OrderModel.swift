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
    
    init(order: Order) {
        self.order = order
    }
    
    func reset() {
        self.order.values = []
    }
    
    func flipValue(title: String, price: Int) {
        self.order.flipValue(title: title, price: price)
    }
    
    func getValueof(title: String) -> String?{
       return self.order.getValue(title: title)
    }
    
    public func setValue(title: String, value: String, price: Int) {
        self.order.setValue(title: title, value: value, price: price)
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
    var totalPrice: Double  {
        get {
            var price = item.price;
            for value in values {
                price = price + Double(value.price)
            }
            return price;
        }
    }
    
    init(values: [CardOrderValue], item: Item, status: OrderStatus = OrderStatus.New, dateTime: String = "", totalPrice: Double) {
        self.values = values
        self.item = item
        self.status = status
        self.dateTime = dateTime
    }
    
    
    init(values: [CardOrderValue], item: Item) {
        self.values = values
        self.item = item
        self.status = OrderStatus.New
        self.dateTime = ""
    }

    
    mutating func setValue(title: String, value: String, price: Int) {
        var isExist = false
        
        for i in 0..<values.count {
            if(values[i].ingredientName == title) {
                values[i].ingredientValue = value
                values[i].price = price
                isExist = true
                break
            }
        }
        
        if(!isExist) {
            values.append(CardOrderValue(ingredientName: title, ingredientValue: value, price: price))
        }
    }
    
    func getValue(title: String) -> String? {
        for i in 0..<values.count {
            if(values[i].ingredientName == title) {
                return values[i].ingredientValue
            }
        }
        
        return nil
    }
    
    mutating func flipValue(title: String, price: Int) {
        for i in 0..<values.count {
            if(values[i].ingredientName == title) {
                values[i].ingredientValue = values[i].ingredientValue == "false" ? "true" : "false";
                values[i].price = price
                break
            }
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
    var price: Int
}
