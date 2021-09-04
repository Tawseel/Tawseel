//
//  ItemView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI
struct ItemView: View {
    var itemModelData : ItemModelData = AppManager.Instance.itemModelData
    @ObservedObject var order: OrderModel
    var item: Item
    @ObservedObject var imageLoader: ImageLoader
    
    var ingredients: [IngredientType: [Ingredient]] {
        Dictionary(
            grouping: item.ingredients,
            by: { $0.type }
        )
    }
    
    init(item: Item) {
        self.item = item
        self.order = OrderModel(item: item)
        imageLoader = ImageLoader()
        for ingredient in self.item.ingredients {
            if(ingredient.type == IngredientType.CheckBox) {
                self.order.setValue(title: ingredient.title, value: "false")
            }
            else if(ingredient.type == IngredientType.MultiChoice && ingredient.values.count > 0) {
                self.order.setValue(title: ingredient.title, value: ingredient.values[0].name)
            }
            else if(ingredient.type == IngredientType.NumberPicker) {
                self.order.setValue(title: ingredient.title, value: "\(ingredient.ingredientConfiguration!.minimumValue)")
            }
        }
    }
    
    var body: some View {
        
        return NavigationView {
            Form {
                Section {
                    imageLoader.loadImage(imageUrl: item.imagePath)
                        .resizable()
                        .frame(width: 155, height: 155)
                    Text(item.name)
                        .font(.caption)
                }
                
                Section {
                    ForEach(ingredients[IngredientType.CheckBox] ?? [], id: \.self) { ingredient in
                        CheckBoxView(ingredient: ingredient, order: self.order)
                    }
                }
                
                Section {
                    ForEach(ingredients[IngredientType.MultiChoice] ?? [], id: \.self) { ingredient in
                        MultiChoiceView(ingredient: ingredient, order: self.order)
                    }
                }
                
                Section {
                    ForEach(ingredients[IngredientType.NumberPicker] ?? [], id: \.self) { ingredient in
                        NumberPickerView(ingredient: ingredient, order: self.order)
                    }
                }
                Section {
                    Button(action: {
                        AppManager.Instance.cart.add(order: order)
                    }) {
                        Text("Add To Card")
                    }
                }
            }
        }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        let ingredients: [Ingredient] = [
            Ingredient(id: 1, title: "CheckBoxView1", itemID: 4, type: IngredientType.CheckBox),
            Ingredient(id: 2, title: "CheckBoxView2", itemID: 4, type: IngredientType.CheckBox),
            Ingredient(id: 3, title: "CheckBoxView3", itemID: 4, type: IngredientType.CheckBox),
            Ingredient(id: 4, title: "MultiChoiceView1", itemID: 4, type: IngredientType.MultiChoice, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)]),
            Ingredient(id: 5, title: "MultiChoiceView2", itemID: 4, type: IngredientType.MultiChoice, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)]),
            Ingredient(id: 6, title: "MultiChoiceView3", itemID: 4, type: IngredientType.MultiChoice, values: [Value(id: 1, name: "Value1", ingredientID: 1), Value(id: 2, name: "Value2", ingredientID: 1)]),
            Ingredient(id: 7, title: "NumberPickerView4", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: IngredientConfiguration(id: 3, minimumValue: 3, maximumValue: 50, step: 4, ingredientID: 4)),
            Ingredient(id: 8, title: "NumberPickerView5", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: IngredientConfiguration(id: 3, minimumValue: 45, maximumValue: 50, step: 4, ingredientID: 4)),
        ]
        
        
        ItemView(item: Item(id: 3, name: "Burger", description: "vfvfvdffvdf", price: 50, category: "Burger", storeID: 3, ingredients: ingredients, imagePath: "steak"))
    }
}
