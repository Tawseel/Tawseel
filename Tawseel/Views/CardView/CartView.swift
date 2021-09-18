//
//  CardView.swift
//  Tawseel
//
//  Created by Obaida Kata on 05/05/2021.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart = AppManager.Instance.cart
    @State var client: Client  = AppManager.Instance.clientModelData.client
    var orderModelData : OrderModelData = AppManager.Instance.orderModelData
    @State private var showingPopover = false
    @ObservedObject var imageLoader: ImageLoader  = ImageLoader()
    @State private var value = 0
    
    let paymentMethods = ["Credit Card", "chash"]
    
    var body: some View {
        if(self.cart.orders.count > 0) {
            Form {
                Section {
                    List {
                        ForEach(self.cart.orders, id: \.self) {  order in
                            CartItemView(orderModel: order)
                        }
                        .onDelete(perform: { indexSet in
                            self.cart.delete(indexSet: indexSet)
                        })
                        
                    }
                }
                
                Section {
                    if(client.defaultAddress == nil) {
                        Text("Must pick default Address before")
                    }
                    else {
                        Button("Buy") {
                            showingPopover = true
                        }
                        .popover(isPresented: $showingPopover) {
                            Form {
                                Section {
                                    Text("Order Details: ").bold()
                                }
                                Section {
                                    Text("First Name: \(client.firstName)").bold()
                                    Text("Last Name: \(client.lastName)").bold()
                                    Text("Phone number: \(client.phoneNumber)").bold()
                                }
                                
                                Section {
                                    Text("Street Name: \(client.defaultAddress!.streetName)").bold()
                                    Text("Street Number: \(client.defaultAddress!.streetNumber)").bold()
                                    Text("Home Number: \(client.defaultAddress!.homeNumber)").bold()
                                    Text("Floor Number: \(client.defaultAddress!.floorNumber)").bold()
                                    Text("Points: \(client.points)").bold()
                                }
                                
                                Section {
                                    Text("Points: \(client.points)").bold()
                                }
                                
                                Section {
                                    Picker(selection: $value, label: Text("Payment Method")) {
                                        ForEach(0 ..< self.paymentMethods.count) {
                                            Text(self.paymentMethods[$0])
                                        }
                                    }
                                    Text("Card Number: 1234-5678-9876-5432").bold()
                                }
                                
                                Section {
                                    Button("Confirm") {
                                        orderModelData.setNewOrders(orders: cart.orders)
                                        self.cart.reset()
                                        showingPopover = false
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        else{
            Text("Cart Empty!")
        }
    }
}
