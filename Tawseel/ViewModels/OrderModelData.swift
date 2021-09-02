//
//  OrderService.swift
//  Tawseel
//
//  Created by obaida kata on 02/09/2021.
//

import Foundation
import Alamofire
import Combine
import SwiftUI

final class OrderModelData: ObservableObject {
    @State var token = AppManager.Instance.token
    let orderAPI = ProcessInfo.processInfo.environment["orderAPI"]
    var error :AFError?
    var headers: HTTPHeaders = []
    
    func setNewOrders(orders : [Order]) {
        let ordersRequest = getOrders(orders: orders)
        if var urlString = orderAPI {
            urlString = urlString + "/addOrders";
            headers.add(name: "Authorization", value: token)
            AF.request(urlString,
                       method: .post, parameters: ordersRequest, encoder: JSONParameterEncoder.default, headers: headers).responseJSON{ response in
                        if let error = response.error {
                            self.error = error
                        }
                        else if let data = response.value as? Bool {
                            if(data)
                            {
                                print("ok")
                            }
                        }
                       }
        }
    }
    
    func getOrders(orders: [Order]) -> [OrderRequest]{
        var tOrders: [OrderRequest] = []
        for order in orders {
            tOrders.append(OrderRequest(order: order))
        }
        
        return tOrders
    }
}
