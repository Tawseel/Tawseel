//
//  Card.swift
//  Tawseel
//
//  Created by Obaida Kata on 05/05/2021.
//

import Foundation
import Combine


class Cart: ObservableObject{
    var didChange = PassthroughSubject<[Item], Never>()
    
    public func add(item: Item){
        items.append(item)
    }
    
    @Published var items: [Item] = []{
        didSet {
            didChange.send(items)
        }
    }
    
    public func delete(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
}
