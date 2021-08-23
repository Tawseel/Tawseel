//
//  Item.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import Foundation
import SwiftUI

struct Ingredients: Decodable{
    var id: Int
    var itemID: Int
    var value: String
    var type: Int
}


struct Item: Decodable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var storeID: Int
    var ingredients: [Ingredients]
    var imagePath: String
}
