//
//  AppManager.swift
//  Tawseel
//
//  Created by Obaida Kata on 04/05/2021.
//

import Foundation
import Combine
import SwiftUI

final class AppManager : ObservableObject
{
    private static var instance: AppManager?
    
    static var Instance: AppManager {
        get {
            if(instance == nil) {
                instance = AppManager()
            }
            
            return instance!
        }
    }
    
    private var modelData1:ModelData?
    
    public var modelData: ModelData {
        get {
            if(modelData1 == nil){
                modelData1 = ModelData()
            }
            
            return modelData1!
        }
    }
    
    private var itemModelData1: ItemModelData?
    
    public var itemModelData: ItemModelData {
        get {
            if(itemModelData1 == nil){
                itemModelData1 = ItemModelData()
            }
            
            return itemModelData1!
        }
    }
    
    private var orderModelData1: OrderModelData?
    
    public var orderModelData: OrderModelData {
        get {
            if(orderModelData1 == nil){
                orderModelData1 = OrderModelData()
            }
            
            return orderModelData1!
        }
    }
    
    @Published public var cart = Cart()
    
    private var loginModel1: LoginModel?
    
    public var loginModel: LoginModel {
        get {
            if(loginModel1 == nil){
                loginModel1 = LoginModel()
            }
            
            return loginModel1!
        }
    }
    var didChange2 = PassthroughSubject<String, Never>()
    @Published var token = ""{
        didSet {
            didChange2.send(token)
        }
    }
    
}
