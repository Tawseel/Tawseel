//
//  PurchaseHistoryView.swift
//  Tawseel
//
//  Created by obaida kata on 04/09/2021.
//

import SwiftUI

struct PurchaseHistoryView: View {
    @ObservedObject var orderModelData: OrderModelData = AppManager.Instance.orderModelData
    
    init() {
    }
    
    var body: some View {
        ScrollView  {
            ForEach(self.orderModelData.orders, id: \.self) {  order in
                HStack {
                    CartItemView(order: order)
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 1, height: 120, alignment: .center)
                        .edgesIgnoringSafeArea(.horizontal)

                    Text("\(order.status.rawValue)")
                        .bold()
                }
            }
        }
        .onAppear() {
            self.orderModelData.getAllPurchaseHistory()
        }
    }
}

struct PurchaseHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseHistoryView()
    }
}
