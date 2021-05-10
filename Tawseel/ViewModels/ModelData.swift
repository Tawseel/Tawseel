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
    let loginApi = ProcessInfo.processInfo.environment["loginApi"]
    @State var token = AppManager.Instance.token
    let storeApi = ProcessInfo.processInfo.environment["storeApi"]
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
        print("loadStores")
        if var urlString = storeApi{
            urlString = urlString + "/getAllStores";
            headers.add(name: "Authorization", value: token)
            AF.request(urlString, headers: headers).response {
                response in
                if let error = response.error {
                    self.error = error
                    print(error)
                }
                else if let data = response.data {
                    do {
                        //Decode dataResponse received from a network request
                        let decoder = JSONDecoder()
                        self.stores = try decoder.decode([StoreDetails].self, from: data)
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
