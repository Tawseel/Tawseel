//
//  ItemModelData.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import Foundation
import Alamofire
import Combine
import SwiftUI


final class ItemModelData: ObservableObject {
    var didChange = PassthroughSubject<[Item], Never>()
    @Published var items: [Item] = [] {
        didSet {
            didChange.send(items)
        }
    }
    
    let loginApi: String? = "https://tawseel.odaiq.co:5100/login"
    @State var token = AppManager.Instance.token
    let itemAPI: String? = "https://tawseel.odaiq.co:5200/store"
    var error :AFError?
    
    

    var categories: [String: [Item]] {
        Dictionary(
            grouping: items,
            by: { $0.category }
        )
    }
    var headers: HTTPHeaders = []
    
    func loadItems(storeID : Int) {
        if var urlString = itemAPI{
            urlString = urlString + "/\(storeID)/items";
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
                        self.items = try decoder.decode([Item].self, from: data)
                        //print(self.stores)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
    }
}

