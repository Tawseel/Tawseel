//
//  NumberPickerView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI

struct NumberPickerView: View {
    var ingredientConfiguration : IngredientConfiguration
    
    init(ingredient: Ingredient) {
        self.ingredientConfiguration = ingredient.ingredientConfiguration[0]
    }
    
    var body: some View {
        VStack {
            Text("\(ingredientConfiguration.minimumValue)")
            Text("\(ingredientConfiguration.maximumValue)")
            Text("\(ingredientConfiguration.step)")
        }
    }
}

struct NumberPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NumberPickerView(ingredient: Ingredient(id: 1, title: "NumberPickerView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: [IngredientConfiguration(id: 3, minimumValue: 4, maximumValue: 50, step: 1, ingredientID: 4)]))
    }
}
