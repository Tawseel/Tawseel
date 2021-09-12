//
//  CheckBoxView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI


struct CheckBoxView: View {
    let id: Int
    let order: OrderModel
    @State var isChecked:Bool
    var title: String
    
    
    init(ingredient: Ingredient, order: OrderModel) {
        self.title = ingredient.title
        self.order = order
        self.id = ingredient.id
        self.isChecked = false
    }
    
    func toggle(){
        self.isChecked = !self.isChecked;
        self.order.flipValue(title: self.title)
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
        CheckBoxView(ingredient: Ingredient(id: 1, title: "CheckBoxView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: IngredientConfiguration(id: 3, minimumValue:-3, maximumValue: 20, step: 4, ingredientID: 4)), order: OrderModel(item: Item()))
    }
}
