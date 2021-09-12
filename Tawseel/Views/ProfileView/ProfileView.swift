//
//  Settings.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var clientModelData: ClientModelData  = AppManager.Instance.clientModelData
    @ObservedObject var imageLoader: ImageLoader  = ImageLoader()
    @State var value: Int = 0
    @State private var showingPopover = false
    @State var newAddress = Address()
    @State var defaultAddress = AppManager.Instance.clientModelData.client.defaultAddress
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Form {
            Section {
                TextField("First Name", text: $clientModelData.client.firstName)
                    .padding(4.0)
                    .border(colorScheme == .dark ? Color.white : Color.black)
                    .cornerRadius(5.0)
                TextField("Last Name", text: $clientModelData.client.lastName)
                    .padding(4.0)
                    .border(colorScheme == .dark ? Color.white : Color.black)
                    .cornerRadius(5.0)
                TextField("Phone number", text: $clientModelData.client.phoneNumber)
                    .padding(4.0)
                    .border(colorScheme == .dark ? Color.white : Color.black)
                    .cornerRadius(5.0)
                TextField("Email", text: $clientModelData.client.email)
                    .padding(4.0)
                    .border(colorScheme == .dark ? Color.white : Color.black)
                    .cornerRadius(5.0)
                
            }
            
            Section {
                Text("Points: \(clientModelData.client.points)").bold()
            }
            
            Section {
                if(clientModelData.client.defaultAddress != nil) {
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text("Default Address: ")
                            .bold()
                        Text("    Street Name: \(defaultAddress!.streetName)")
                        Text("    Street Number: \(defaultAddress!.streetNumber)")
                        Text("    Home Number: \(defaultAddress!.homeNumber)")
                        Text("    Floor Number: \(defaultAddress!.floorNumber)")
                    })
                }
                
                if(clientModelData.isFromServer) {
                    AddressView(action: clientDefaultAddressChanged)
                }
                
                Button("Add New Address") {
                    showingPopover = true
                }
                .popover(isPresented: $showingPopover) {
                    TextField("Street Name", text: $newAddress.streetName)
                        .padding(4.0)
                        .border(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(5.0)
                    TextField("Street Number", text: $newAddress.streetNumber)
                        .padding(4.0)
                        .border(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(5.0)
                    TextField("Home Number", text: $newAddress.homeNumber)
                        .padding(4.0)
                        .border(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(5.0)
                    TextField("Floor Number", text: $newAddress.floorNumber)
                        .padding(4.0)
                        .border(colorScheme == .dark ? Color.white : Color.black)
                        .cornerRadius(5.0)
                    
                    Button("Add") {
                        clientModelData.client.addresses.append(self.newAddress)
                        AppManager.Instance.clientModelData.updateClient()
                    }
                }
            }
        }.onAppear() {
            AppManager.Instance.clientModelData.getClient()
        }
        .onDisappear() {
            AppManager.Instance.clientModelData.updateClient()
        }
        
    }
    
    
    func clientDefaultAddressChanged(value: Int) {
        clientModelData.client.defaultAddress = clientModelData.client.addresses[value]
        defaultAddress = clientModelData.client.addresses[value]
        AppManager.Instance.clientModelData.updateClient()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

