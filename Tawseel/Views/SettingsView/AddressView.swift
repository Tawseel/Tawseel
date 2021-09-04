//
//  AddressView.swift
//  Tawseel
//
//  Created by obaida kata on 03/09/2021.
//

import SwiftUI

struct AddressView: View {
    @State var addresses: [Address]
    @State var value: Int = 0
    let onChange: (Int) -> Void
    
    init(addresses: [Address], action: @escaping (Int) -> Void) {
        self.addresses = addresses
        self.onChange = action
    }
    
    var body: some View {
        
        Picker(selection: $value, label: Text("Select default address")) {
            ForEach(0 ..< self.addresses.count) {
                Text(self.addresses[$0].streetName)
            }
        }.onChange(of: value) { value in
            self.onChange(value)
        }
    }
}

//struct AddressView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressView(addresses: [Address(streetName: "streetName3", streetNumber: "33", homeNumber: "53", floorNumber: "3")])
//    }
//}
