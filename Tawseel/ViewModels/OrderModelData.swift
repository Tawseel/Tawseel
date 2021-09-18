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
    let orderAPI: String? = "https://tawseel.odaiq.co:5200/order"
    var error :AFError?
    var headers: HTTPHeaders = []
    
    var didChange = PassthroughSubject<[Order], Never>()
    @Published var orders: [Order] = [] {
        didSet {
            didChange.send(orders)
        }
    }
    
    func setNewOrders(orders : [OrderModel]) {
        let ordersRequest = self.getOrders(ordersModels: orders)
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
    
    func getOrders(ordersModels: [OrderModel]) -> [Order]{
        var orders: [Order] = []
        for order in ordersModels {
            orders.append(order.order)
        }
        
        return orders
    }
    
    func getAllPurchaseHistory() {
        if var urlString = orderAPI {
            urlString = urlString + "/purchaseHistory";
            headers.add(name: "Authorization", value: token)
            AF.request(urlString, headers: headers).response { response in
                if let error = response.error {
                    self.error = error
                    print(error)
                }
                else if let data = response.data {
                    do {
                        //Decode dataResponse received from a network request
                        let decoder = JSONDecoder()
                        self.orders = try decoder.decode([Order].self, from: data)
                        //print(self.stores)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
    }
}
