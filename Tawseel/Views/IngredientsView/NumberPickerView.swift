//
//  NumberPickerView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI

struct NumberPickerView: View {
    @State private var selectedValueName  = 0
    var ingredientConfiguration : IngredientConfiguration
    var values: [Int]
    var minimumValue: Int
    var maximumValue: Int
    var step: Int
    
    init(ingredient: Ingredient) {
        self.ingredientConfiguration = ingredient.ingredientConfiguration[0]
        self.minimumValue = self.ingredientConfiguration.minimumValue
        self.maximumValue = self.ingredientConfiguration.maximumValue
        self.step = self.ingredientConfiguration.step
        selectedValueName = minimumValue
        self.values = []
        for i in stride(from: self.minimumValue, to: self.maximumValue, by: step) {
            self.values.append(i);
        }
    }
    
    var body: some View {
        VStack {
            Picker("Favorite Color", selection: $selectedValueName, content: {
                ForEach(values , id: \.self) { value in
                    Text("\(value)").tag(value)
                }
            })
            Text("Selected value name: \(selectedValueName)")
            
        }
    }
}

struct NumberPickerView_Previews: PreviewProvider {
    static var previews: some View {
        NumberPickerView(ingredient: Ingredient(id: 1, title: "NumberPickerView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: [IngredientConfiguration(id: 3, minimumValue: 4, maximumValue: 50, step: 4, ingredientID: 4)]))
    }
}
