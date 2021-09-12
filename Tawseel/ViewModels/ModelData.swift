//
//  ModelData.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import Foundation
import Combine
import SwiftUI
import Alamofire

final class ModelData: ObservableObject {
    var didChange = PassthroughSubject<[StoreDetails], Never>()
    @Published var stores: [StoreDetails] = [] {
        didSet {
            didChange.send(stores)
        }
    }
    let loginApi: String? = "https://tawseel.odaiq.co:5100/login"
    @State var token = AppManager.Instance.token
    let storeApi: String? = "https://tawseel.odaiq.co:5200/store"
    var error :AFError?
    
//    var features: [StoreDetails] {
//        stores.filter { $0.isFeatured }
//    }
    
    var categories: [String: [StoreDetails]] {
        Dictionary(
            grouping: stores,
            by: { $0.category }
        )
    }
    
    var headers: HTTPHeaders = []
    
    func loadStores() {
        if var urlString = storeApi{
            urlString = urlString + "/getAllStores";
            headers.add(name: "Authorization", value: token)
            AF.request(urlString, headers: headers).response {
                response in
//                if let data = response.data {
//                    let json = String(data: data, encoding: String.Encoding.utf8)
//                    print(json)
//                }
                
                if let error = response.error {
                    self.error = error
                    print(error)
                }
                else if let data = response.data {
                    do {
                        //Decode dataResponse received from a network request
                        let decoder = JSONDecoder()
                        self.stores = try decoder.decode([StoreDetails].self, from: data)
                        //print(self.stores)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
    }
}
        
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
