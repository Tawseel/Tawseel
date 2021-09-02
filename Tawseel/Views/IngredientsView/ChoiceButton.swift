//
//  ChoiceButton.swift
//  Tawseel
//
//  Created by obaida kata on 31/08/2021.
//

import SwiftUI

struct ChoiceButton: View {
    var value : String
    
    init(value: String) {
        self.value = value;
    }
    
    var body: some View {
        Text("\(value)")
    }
}

struct ChoiceButton_Previews: PreviewProvider {
    static var previews: some View {
        ChoiceButton(value: "Test")
    }
}
