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
    @State var isChecked: Bool
    var title: String
    var price: Int
    
    
    init(ingredient: Ingredient, order: OrderModel) {
        self.title = ingredient.title
        self.order = order
        self.id = ingredient.id
        let value = order.getValueof(title: ingredient.title) ?? "false"
        self.isChecked = value == "true"
        self.price = ingredient.price
    }
    
    func toggle(){
        isChecked = !isChecked
        self.order.flipValue(title: self.title, price: isChecked ? self.price : 0)
    }
    
    var body: some View {
        HStack{
            Button(action: toggle ){
                Image(systemName: isChecked  ? "checkmark.square": "square")
            }
            Text(title)
            Spacer()
            Text("+\(price)")
        }
    }
}

struct CheckBoxView_Previews: PreviewProvider {
    static var previews: some View {
        CheckBoxView(ingredient: Ingredient(id: 1, title: "CheckBoxView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: IngredientConfiguration(id: 3, minimumValue:-3, maximumValue: 20, price: 4)), order: OrderModel(item: Item()))
    }
}
