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
        orders.append(order)
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
