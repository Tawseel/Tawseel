//
//  Item.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import Foundation
import SwiftUI

enum IngredientType: String, Decodable, Hashable, Encodable{
    case CheckBox
    case MultiChoice
    case NumberPicker
}

struct Value: Decodable, Hashable, Encodable{
    var id: Int
    var name: String
    var price: Int = 0
    var ingredientID: Int
}

struct IngredientConfiguration: Decodable, Hashable,Identifiable, Encodable{
    var id: Int = 0
    var minimumValue: Int = 1
    var maximumValue: Int = 50
    var price: Int = 0
    var ingredientID: Int = 0
}

struct Ingredient: Decodable, Hashable, Identifiable, Encodable{
    var id: Int
    var price: Int = 0
    var title: String
    var itemID: Int
    var type: IngredientType
    var values: [Value] = []
    var ingredientConfiguration: IngredientConfiguration?
}


struct Item: Identifiable, Decodable, Hashable, Encodable{
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var storeID: Int
    var ingredients: [Ingredient]
    var imagePath: String
    
    init(id: Int, name: String, description: String, price: Double, category: String, storeID: Int, ingredients: [Ingredient], imagePath: String) {
        self.id = id
        self.name = name
        self.description = description
        self.price = price
        self.category = category
        self.storeID = storeID
        self.ingredients = ingredients
        self.imagePath = imagePath
    }

    
    init() {
        self.init(id: 0, name: "", description: "", price: 0.0, category: "", storeID: 0, ingredients: [], imagePath: "")
    }
    
}
