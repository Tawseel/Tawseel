//
//  Settings.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct ProfileView: View {
    @State var client: Client
    @ObservedObject var imageLoader: ImageLoader  = ImageLoader()
    @State var value: Int = 0
    @State private var showingPopover = false
    @State var newAddress = Address()
    
    init() {
        self.client = Client(profileImagePath: "person", firstName: "obaida", lastName: "kata", phoneNumber: "0524388203", email: "obaida2_18@me.com", defaultAddress: Address(streetName: "streetName3", streetNumber: "33", homeNumber: "53", floorNumber: "3"), addresses: [Address(streetName: "streetName1", streetNumber: "31", homeNumber: "51", floorNumber: "5"), Address(streetName: "streetName", streetNumber: "30", homeNumber: "50", floorNumber: "5")])
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    imageLoader.loadLocal(iconName: client.profileImagePath)
                        .resizable()
                        .frame(width: 155, height: 155)
                    TextField("First Name", text: $client.firstName)
                        .padding(4.0)
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                    TextField("Last Name", text: $client.lastName)
                        .padding(4.0)
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                    TextField("Phone number", text: $client.phoneNumber)
                        .padding(4.0)
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                    TextField("Email", text: $client.email)
                        .padding(4.0)
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                    
                }
                
                Section {
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text("Default Address: ")
                            .bold()
                        Text("    Street Name: \(client.defaultAddress.streetName)")
                        Text("    Street Number: \(client.defaultAddress.streetNumber)")
                        Text("    Home Number: \(client.defaultAddress.homeNumber)")
                        Text("    Floor Number: \(client.defaultAddress.floorNumber)")
                    })
                    
                    AddressView(addresses: client.addresses, action: clientDefaultAddressChanged)
                    
                    Button("Add New Address") {
                        showingPopover = true
                    }
                    .popover(isPresented: $showingPopover) {
                        TextField("First Name", text: $newAddress.streetName)
                            .padding(4.0)
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                        TextField("Last Name", text: $newAddress.streetNumber)
                            .padding(4.0)
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                        TextField("Phone number", text: $newAddress.homeNumber)
                            .padding(4.0)
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                        TextField("Email", text: $newAddress.floorNumber)
                            .padding(4.0)
                            .background(lightGreyColor)
                            .cornerRadius(5.0)
                        
                        Button("Add") {
                            self.client.addresses.append(self.newAddress)
                        }
                        
                    }
                }
                
                Section {
                    
                }
                Section {
                }
            }
        }
        
    }
    
    
    func clientDefaultAddressChanged(value: Int) {
        self.client.defaultAddress = self.client.addresses[value]
    }
    
    func addAddress() {
        self.client.addresses.append(newAddress)
        self.newAddress = Address()
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

