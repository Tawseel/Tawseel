//
//  Card.swift
//  Tawseel
//
//  Created by Obaida Kata on 05/05/2021.
//

import Foundation
import Combine


class Cart: ObservableObject{
    var didChange = PassthroughSubject<[Order], Never>()
    
    public func add(order: Order){
        orders.append(order)
    }
    
    @Published var orders: [Order] = []{
        didSet {
            didChange.send(orders)
        }
    }
    
    public func delete(indexSet: IndexSet){
        orders.remove(atOffsets: indexSet)
    }
}
