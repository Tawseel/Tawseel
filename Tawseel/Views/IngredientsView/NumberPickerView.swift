//
//  NumberPickerView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI

struct NumberPickerView: View {
    var order: OrderModel
    @State var value: Int
    
    var minimumValue: Int
    var maximumValue: Int
    let title: String
    let id: Int
    init(ingredient: Ingredient, order: OrderModel) {
        let ingredientConfiguration = ingredient.ingredientConfiguration!
        self.minimumValue = ingredientConfiguration.minimumValue
        self.maximumValue = ingredientConfiguration.maximumValue
        self.title = ingredient.title
        self.id = ingredient.id
        self.value = self.minimumValue;
        self.order = order
    }
    
    var body: some View {
        Stepper(value: $value, in: self.minimumValue...self.maximumValue) {
            Text("quantity of \(title): \(value)")
        }.onChange(of: self.value, perform: { value in
            self.order.setValue(title: self.title, value: "\(self.value)")
        })
    }
}

struct NumberPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NumberPickerView(ingredient: Ingredient(id: 1, title: "NumberPickerView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: IngredientConfiguration(id: 3, minimumValue:-3, maximumValue: 20, step: 4, ingredientID: 4)), order: OrderModel(item: Item()))
    }
}
