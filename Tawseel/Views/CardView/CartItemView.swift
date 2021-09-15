//
//  CartItemView.swift
//  Tawseel
//
//  Created by obaida kata on 02/09/2021.
//

import SwiftUI

struct CartItemView: View  {
    @ObservedObject var imageLoader: ImageLoader
    let item: Item
    let order: Order
    init(orderModel: OrderModel){
        self.imageLoader = ImageLoader()
        self.item = orderModel.order.item
        self.order = orderModel.order
    }
    
    init(order: Order){
        self.imageLoader = ImageLoader()
        self.order = order
        self.item = order.item
        
    }
    
    var body: some View {
        HStack{
            VStack (alignment: .center){
                imageLoader.loadImage(imageUrl: item.imagePath)
                    .resizable()
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
                Text(item.name)
                    .font(.headline)
            }
            VStack (alignment: .leading){
                Text(item.description)
                    .font(.subheadline)
                ForEach(self.order.values.indices, id: \.self) { i in
                    let ingredientValue = self.order.values[i].ingredientValue
                    let ingredientName = self.order.values[i].ingredientName
                    if(ingredientName.count > 0 && ingredientValue.count > 0) {
                        if(ingredientValue == "true") {
                            Text("With \(ingredientName)")
                        }
                        else if(ingredientValue != "false") {
                            Text("\(ingredientName): \(ingredientValue)")
                        }
                    }
                }
                
            }.padding(.leading, 8)
        }
        .padding(.init(top: 12, leading: 0, bottom: 12, trailing: 0))
    }
}

struct CartItemView_Previews: PreviewProvider {
    
    static var previews: some View {
        let ingredients: [Ingredient] = [
            Ingredient(id: 1, title: "CheckBoxView1", itemID: 4, type: IngredientType.CheckBox),
            Ingredient(id: 2, title: "CheckBoxView2", itemID: 4, type: IngredientType.CheckBox),
            Ingredient(id: 3, title: "CheckBoxView3", itemID: 4, type: IngredientType.CheckBox),
            Ingredient(id: 4, title: "MultiChoiceView1", itemID: 4, type: IngredientType.MultiChoice, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)]),
            Ingredient(id: 5, title: "MultiChoiceView2", itemID: 4, type: IngredientType.MultiChoice, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)]),
            Ingredient(id: 6, title: "MultiChoiceView3", itemID: 4, type: IngredientType.MultiChoice, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)]),
            Ingredient(id: 7, title: "NumberPickerView4", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: IngredientConfiguration(id: 3, minimumValue: 3, maximumValue: 50, price: 4, ingredientID: 4)),
            Ingredient(id: 8, title: "NumberPickerView5", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: IngredientConfiguration(id: 3, minimumValue: 45, maximumValue: 50, price: 4, ingredientID: 4)),
        ]
        
        CartItemView(orderModel: OrderModel(item: Item(id: 0, name: "the best burger ever!!!", description: "db ngfdbgbgf", price: 50, category: "Burger", storeID: 0, ingredients: ingredients, imagePath: "")))
    }
}
