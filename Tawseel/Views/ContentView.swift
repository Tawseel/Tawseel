//
//  ContentView.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var loginModel = AppManager.Instance.loginModel
    
    var body: some View {
        NavigationView {
            if(loginModel.isLogIn) {
                TawseelView()
            }
            else {
                SignInView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
