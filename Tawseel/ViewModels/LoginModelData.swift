//
//  LoginModel.swift
//  Tawseel
//
//  Created by Obaida Kata on 04/05/2021.
//
import Combine
import Foundation
import Alamofire

final class LoginModelData: ObservableObject{
    var didChange = PassthroughSubject<Bool, Never>()
    let loginApi = ProcessInfo.processInfo.environment["loginApi"]
    var error :AFError?
    
    @Published var isLogIn = false{
        didSet {
            didChange.send(isLogIn)
        }
    }
    
    public func login(logInCredentials: LogInCredentials){
        if var urlString =  loginApi {
            urlString = urlString + "/signin/Client"
            AF.request(urlString,
                       method: .post,
                       parameters: logInCredentials,
                       encoder: JSONParameterEncoder.default).responseJSON{ response in
                        if let error = response.error {
                            self.error = error
                        }
                        else if let data = response.value as? Bool {
                            self.isLogIn = data
                            if(data)
                            {
                                if let token = response.response?.allHeaderFields["Authorization"] as? String {
                                    AppManager.Instance.token = token
                                }
                            }
                        }
                       }
        }
    }
    
    public func signUp(client: ClientDetails,  action: @escaping (Bool) -> Void){
        if var urlString =  loginApi {
            urlString = urlString + "/register/client"
            AF.request(urlString,
                       method: .post,
                       parameters: client,
                       encoder: JSONParameterEncoder.default).responseJSON{ response in
                        if let error = response.error {
                            self.error = error
                        }
                        else if let data = response.value as? Bool {
                            if(data)
                            {
                                DispatchQueue(label: "concurrentQueue", attributes: .concurrent).async {
                                action(data)
                                }
                            }
                        }
                       }
        }
    }
    
}

