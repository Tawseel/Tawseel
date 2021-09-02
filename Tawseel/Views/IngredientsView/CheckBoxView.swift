//
//  CheckBoxView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI
import SimpleCheckbox


struct CheckBoxView: View {
    let id: Int
    let order: Order
    @State var isChecked:Bool
    var title: String
    
    
    init(ingredient: Ingredient, order: Order) {
        self.title = ingredient.title
        self.order = order
        self.id = ingredient.id
        self.isChecked = false
    }
    
    func toggle(){
        isChecked = !isChecked;
        self.order.values[self.title] = "\(isChecked)"
    }
    
    var body: some View {
        HStack{
            Button(action: toggle ){
                Image(systemName: isChecked ? "checkmark.square": "square")
            }
            Text(title)
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(ingredient: Ingredient(id: 1, title: "CheckBoxView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: []), order: Order(item: Item()))
    }
}
