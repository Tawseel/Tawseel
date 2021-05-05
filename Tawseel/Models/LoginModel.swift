//
//  LoginModel.swift
//  Tawseel
//
//  Created by Obaida Kata on 04/05/2021.
//
import Combine
import Foundation

final class LoginModel: ObservableObject{
    var didChange = PassthroughSubject<Bool, Never>()
    let loginApi = ProcessInfo.processInfo.environment["loginApi"]
    
    @Published var isLogIn = false{
        didSet {
            didChange.send(isLogIn)
        }
    }
    
    
    public func loadImage(logInCredentials: LogInCredentials) -> Bool {
        
//        guard var urlString = loginApi else {return false}
//        urlString =  urlString + "/signin/Client"
//        
//        guard let url = URL(string: urlString) else {return false}
//
//
//
        return isLogIn
    }
}
