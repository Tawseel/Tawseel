//
//  MultiChoiceView.swift
//  Tawseel
//
//  Created by obaida kata on 31/08/2021.
//

import SwiftUI

struct MultiChoiceView: View {
    let id: Int
    let order: OrderModel
    @State var value: Int = 0
    
    let title: String
    let values: [Value]
    
    init(ingredient: Ingredient, order:OrderModel) {
        self.order = order
        self.id = ingredient.id
        self.title = ingredient.title
        self.values = ingredient.values
    }
    
    var body: some View {
            Picker(selection: $value, label: Text("Please choose \(title)")) {
                ForEach(0 ..< self.values.count) {
                    Text(self.values[$0].name)
                }
            }.onChange(of: value) { value in
                self.order.setValue(title: self.title, value: self.values[value].name)
            }
    }
}

struct MultiChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        MultiChoiceView(ingredient: Ingredient(id: 2, title: "MultiChoiceView", itemID: 4, type: IngredientType.NumberPicker, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)], ingredientConfiguration:IngredientConfiguration(id: 0, minimumValue: 1, maximumValue: 20, step: 3, ingredientID: 3)), order: OrderModel(item: Item()))
    }
}
