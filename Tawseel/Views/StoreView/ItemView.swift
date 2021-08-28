//
//  ItemView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI

struct ItemView: View {
    var item: Item
    @ObservedObject var imageLoader: ImageLoader
    @ObservedObject var cart = AppManager.Instance.cart
    
    var ingredients: [IngredientType: [Ingredient]] {
        Dictionary(
            grouping: item.ingredients,
            by: { $0.type }
        )
    }
    
    init(item: Item) {
        self.item = item
        imageLoader = ImageLoader()
    }
    
    var body: some View {
            VStack(alignment: .leading) {
                imageLoader.loadImage(imageUrl: item.imagePath)
                        .resizable()
                        .frame(width: 155, height: 155)
                Text(item.name)
                    .font(.caption)
                
                Text("Ingredients")
                    .font(.caption)
                Spacer()
                ForEach(ingredients[IngredientType.CheckBox] ?? [], id: \.self) { ingredient in
                    CheckBoxView(ingredient: ingredient)
                }
                Spacer()
                ForEach(ingredients[IngredientType.MultiChoice] ?? [], id: \.self) { ingredient in
                    MultiChoiceView(ingredient: ingredient)
                }
                Spacer()
                ForEach(ingredients[IngredientType.NumberPicker] ?? [], id: \.self) { ingredient in
                    NumberPickerView(ingredient: ingredient)
                }
            }
    }
}

struct ItemView_Previews: PreviewProvider {
    static var previews: some View {
        ItemView(item: AppManager.Instance.itemModelData.items[0])
    }
}
