//
//  CardView.swift
//  Tawseel
//
//  Created by Obaida Kata on 05/05/2021.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var cart: Cart = AppManager.Instance.cart
    var orderModelData : OrderModelData = AppManager.Instance.orderModelData
    
    var body: some View {
        if(self.cart.orders.count > 0) {
            List {
                ForEach(self.cart.orders, id: \.self) {  order in
                    CartItemView(order: order)
                }
                .onDelete(perform: { indexSet in
                    self.cart.delete(indexSet: indexSet)
                })
//                Section {
                    Button(action: {
                        orderModelData.setNewOrders(orders: cart.orders)
                    }) {
                        Text("Add To Card")
                    }
//                }
            }
        }
        else{
            Text("Cart Empty!")
        }
    }
}
