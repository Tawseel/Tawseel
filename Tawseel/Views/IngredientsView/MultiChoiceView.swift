//
//  MultiChoiceView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI

struct MultiChoiceView: View {
    var title : String
    var values : [Value]
    
    init(ingredient: Ingredient) {
        self.values = ingredient.values
        self.title = ingredient.title
    }
    
    var body: some View {
        VStack {
            Text("\(title)")
            ForEach(values , id: \.self) { value in
                Text("\(value.name)")
            }
        }
        
    }
}

struct MultiChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(ingredient: Ingredient(id: 1, title: "CheckBoxView", itemID: 4, type: IngredientType.NumberPicker, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)], ingredientConfiguration: []))
    }
}
