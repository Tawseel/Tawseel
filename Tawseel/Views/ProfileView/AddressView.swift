//
//  AddressView.swift
//  Tawseel
//
//  Created by obaida kata on 03/09/2021.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var clientModelData: ClientModelData  = AppManager.Instance.clientModelData
    @State var value: Int = 0
    let onChange: (Int) -> Void
    
    init(action: @escaping (Int) -> Void) {
        self.onChange = action
    }
    
    var body: some View {
        if(clientModelData.client.addresses.count > 0) {
                Picker(selection: $value, label: Text("Select default address")) {
                    ForEach(0 ..< clientModelData.client.addresses.count, id: \.self) {
                        Text(clientModelData.client.addresses[$0].streetName)
                    }
                }.onChange(of: value) { value in
                    self.onChange(value)
                }
        }
    }
}

//struct AddressView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddressView(addresses: [Address(streetName: "streetName3", streetNumber: "33", homeNumber: "53", floorNumber: "3")])
//    }
//}
