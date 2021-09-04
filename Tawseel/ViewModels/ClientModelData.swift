//
//  ClientModelDate.swift
//  Tawseel
//
//  Created by obaida kata on 02/09/2021.
//

import Foundation

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


final class ClientModelData: ObservableObject {
    @State var token = AppManager.Instance.token
    var error :AFError?
    let clientAPI = ProcessInfo.processInfo.environment["clientAPI"]
    var headers: HTTPHeaders = []
    
    var didChange = PassthroughSubject<[Item], Never>()
    @Published var recommendedItems: [Item] = [] {
        didSet {
            didChange.send(recommendedItems)
        }
    }
    
    var clientDidChange = PassthroughSubject<Client, Never>()
    @Published var client: Client =  Client(id: 0, firstName: "obaida", lastName: "kata", phoneNumber: "0524388203", email: "obaida2_18@me.com", defaultAddress: Address(streetName: "streetName3", streetNumber: "33", homeNumber: "53", floorNumber: "3"), addresses: [Address(streetName: "streetName1", streetNumber: "31", homeNumber: "51", floorNumber: "5"), Address(streetName: "streetName", streetNumber: "30", homeNumber: "50", floorNumber: "5")], points: 5)  {
        didSet {
            clientDidChange.send(client)
        }
    }
    
    func getClient() {
        if let urlString = clientAPI {
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
                        self.client = try decoder.decode(Client.self, from: data)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
    }
    
    func updateClient() {
        if var urlString = clientAPI {
            urlString = urlString + "/updateClientDetails"
            headers.add(name: "Authorization", value: token)
            AF.request(urlString,
                       method: .put, parameters: client, encoder: JSONParameterEncoder.default, headers: headers).responseJSON{ response in
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
    
    
    func getRecommendedItemst() {
        if var urlString = clientAPI {
            urlString = urlString + "/recommendedItems"
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
                        self.recommendedItems = try decoder.decode([Item].self, from: data)
                    } catch let parsingError {
                        print("Error", parsingError)
                    }
                }
            }
        }
    }
}

