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
                                    Text("Ship Details: ").bold()
                                }
                                Section {
                                    Text("First Name: \(client.firstName)").bold()
                                    Text("Last Name: \(client.lastName)").bold()
                                    Text("Phone number: \(client.phoneNumber)").bold()
                                    Text("Street Name: \(client.defaultAddress!.streetName)").bold()
                                    Text("Street Number: \(client.defaultAddress!.streetNumber)").bold()
                                    Text("Home Number: \(client.defaultAddress!.homeNumber)").bold()
                                    Text("Floor Number: \(client.defaultAddress!.floorNumber)").bold()
                                    Text("Points: \(client.points)").bold()
                                }
                                
                                Section {
                                    Button("Confirm") {
                                        //                                    orderModelData.setNewOrders(orders: orderModelData.orders)
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
