//
//  Card.swift
//  Tawseel
//
//  Created by Obaida Kata on 05/05/2021.
//

import Foundation
import Combine


class Cart: ObservableObject{
    var didChange = PassthroughSubject<[OrderModel], Never>()
    
    public func add(order: OrderModel){
        let iOrder = order.order
        var copiedValues: [CardOrderValue] = []
        for value in order.order.values {
            copiedValues.append(value)
        }
            
        let orderClone = Order(values: copiedValues, item: iOrder.item, status: iOrder.status, dateTime: iOrder.dateTime, totalPrice: iOrder.totalPrice)
        orders.append(OrderModel(order: orderClone))
    }
    
    @Published var orders: [OrderModel] = []{
        didSet {
            didChange.send(orders)
        }
    }
    
    public func delete(indexSet: IndexSet){
        orders.remove(atOffsets: indexSet)
    }
}
