//
//  CheckBoxView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI

struct CheckBoxView: View {
    var title: String
    
    init(ingredient: Ingredient) {
        self.title = ingredient.title
    }
    var body: some View {
        Text("\(self.title)")
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(ingredient: Ingredient(id: 1, title: "CheckBoxView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: []))
    }
}
