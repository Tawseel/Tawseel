//
//  UserData.swift
//  Tawseel
//
//  Created by obaida kata on 03/09/2021.
//

import Foundation


struct ClientDetails: Decodable, Encodable{
    var firstName: String = ""
    var lastName: String = ""
    var phoneNumber: String = ""
    var email: String = ""
    var password: String = ""
}


struct Client: Hashable, Decodable, Encodable{
    var id: Int
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String
    var defaultAddress: Address?
    var addresses: [Address] = []
    var points: Int
}

struct Address: Hashable, Decodable, Encodable, Identifiable {
    var id: Int = 0
    var streetName: String = ""
    var streetNumber: String = ""
    var homeNumber: String = ""
    var floorNumber: String = ""
    var clientID: Int = 0
}
