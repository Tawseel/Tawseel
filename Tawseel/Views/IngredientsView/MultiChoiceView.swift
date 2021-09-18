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
    @State var value: Int
    
    let title: String
    let price: Int
    
    let values: [Value]
    
    init(ingredient: Ingredient, order:OrderModel) {
        self.order = order
        self.id = ingredient.id
        self.title = ingredient.title
        self.values = ingredient.values
        self.price = ingredient.price
        if let defualtIndex = MultiChoiceView.valueIndex(values: ingredient.values, valueToLookFor: order.getValueof(title: ingredient.title) ?? "") {
            self.value = defualtIndex
        }
        else {
            self.value = 0
        }
    }
    
    static func valueIndex(values: [Value], valueToLookFor: String?) -> Int?{
        for i in 0..<values.count {
            if(values[i].name == valueToLookFor) {
                return i
            }
        }
        
        return nil
    }
    
    var body: some View {
        
        Picker(selection: $value, label: Text("Please choose \(title): +\(values[value].price)")) {
            ForEach(0 ..< self.values.count) {
                Text(self.values[$0].name)
            }
        }.onChange(of: value) { value in
            self.order.setValue(title: self.title, value: self.values[value].name, price: values[value].price)
        }
    }
}

struct MultiChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        MultiChoiceView(ingredient: Ingredient(id: 2, title: "MultiChoiceView", itemID: 4, type: IngredientType.NumberPicker, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)], ingredientConfiguration:IngredientConfiguration(id: 0, minimumValue: 1, maximumValue: 20, price: 3)), order: OrderModel(item: Item()))
    }
}
