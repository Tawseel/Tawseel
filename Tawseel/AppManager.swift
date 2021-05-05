//
//  AppManager.swift
//  Tawseel
//
//  Created by Obaida Kata on 04/05/2021.
//

import Foundation
import Combine

class AppManager
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
    
    @Published public var cart = Cart()
}
