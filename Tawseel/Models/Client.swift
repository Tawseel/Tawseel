//
//  UserData.swift
//  Tawseel
//
//  Created by obaida kata on 03/09/2021.
//

import Foundation

struct Client: Hashable{
    var profileImagePath: String
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var email: String
    var defaultAddress: Address
    var addresses: [Address]
}

struct Address: Hashable {
    var streetName: String = ""
    var streetNumber: String = ""
    var homeNumber: String = ""
    var floorNumber: String = ""
}
