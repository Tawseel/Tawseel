//
//  LogInCredentials.swift
//  Tawseel
//
//  Created by Obaida Kata on 04/05/2021.
//

import Foundation

struct LogInCredentials: Encodable {
    let email:String;
    let password:String;
    
    init(email: String, password: String) {
        self.email = email
        self.password = password
    }
}
