//
//  CheckBoxView.swift
//  Tawseel
//
//  Created by obaida kata on 28/08/2021.
//

import SwiftUI
import SimpleCheckbox

struct CheckBoxView: View {
    @State var isChecked:Bool = false
    var title: String
    
    
    init(ingredient: Ingredient) {
        self.title = ingredient.title
    }
    
    func toggle(){
        isChecked = !isChecked;
        
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
        CheckBoxView(ingredient: Ingredient(id: 1, title: "CheckBoxView", itemID: 4, type: IngredientType.NumberPicker, values: [], ingredientConfiguration: []))
    }
}
