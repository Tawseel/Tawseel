//
//  MultiChoiceView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI

struct MultiChoiceView: View {
    var values : [Value]
    @State private var selectedValueName  = ""
    var title : String
    
    
    init(ingredient: Ingredient) {
        self.values = ingredient.values
        self.title = ingredient.title
        selectedValueName = self.values[0].name
    }
    
    var body: some View {
        VStack {
            Text("\(title)")
            Picker("Favorite Color", selection: $selectedValueName, content: {
                ForEach(values , id: \.self) { value in
                    Text("\(value.name)").tag(value.name)
                }
            })
            Text("Selected value name: \(selectedValueName)")
            
        }
        
    }
}

struct MultiChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        MultiChoiceView(ingredient: Ingredient(id: 1, title: "CheckBoxView", itemID: 4, type: IngredientType.NumberPicker, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)], ingredientConfiguration: []))
    }
}
