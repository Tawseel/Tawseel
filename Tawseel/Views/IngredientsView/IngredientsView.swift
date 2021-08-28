//
//  IngredientsView.swift
//  Tawseel
//
//  Created by Ahmad Salama on 22/08/2021.
//

import SwiftUI

struct IngredientsView: View {
    @State var selected = ""
    @State var show = false
    
    var body: some View {
        ZStack{

            VStack{

                Spacer()

                RadioButtons(selected: self.$selected,show: self.$show).offset(y: self.show ? (UIApplication.shared.windows.last?.safeAreaInsets.bottom)! + 15 : UIScreen.main.bounds.height)

            }.background(Color(UIColor.label.withAlphaComponent(self.show ? 0.2 : 0)).edgesIgnoringSafeArea(.all))

        }.background(Color("Color2").edgesIgnoringSafeArea(.all))
        .animation(.default)
    }
}

struct IngredientsView_Previews: PreviewProvider {
    static var previews: some View {
        IngredientsView()
    }
}
