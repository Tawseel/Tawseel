//
//  Item.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import Foundation
import SwiftUI

enum IngredientType: String, Decodable, Hashable{
    case CheckBox
    case MultiChoice
    case NumberPicker
}

struct Value: Decodable, Hashable{
    var id: Int
    var name: String
    var ingredientID: Int
}

struct IngredientConfiguration: Decodable, Hashable,Identifiable{
    var id: Int
    var minimumValue: Int
    var maximumValue: Int
    var step: Int
    var ingredientID: Int
}

struct Ingredient: Decodable, Hashable, Identifiable{
    var id: Int
    var title: String
    var itemID: Int
    var type: IngredientType
    var values: [Value]
    var ingredientConfiguration: [IngredientConfiguration]
}


struct Item: Identifiable, Decodable, Hashable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var storeID: Int
    var ingredients: [Ingredient]
    var imagePath: String
}
