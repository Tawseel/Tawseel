//
//  ContentView.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct SignInView: View {
    @State var username = ""
    @State var password = ""
    var isLoggedIn = false
    
    var body: some View {
            VStack {
                TextField("Username", text: $username)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(lightGreyColor)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                NavigationLink (
                    destination: TawseelView(),
                    label: {
                        LoginButton()
                    })
                    .disabled(isLoggedIn)
                    .onTapGesture {
                        print("ALERT MAYBE")
                    }
                
                NavigationLink (
                    destination: SignUpView(),
                    label: {
                        Text("Sign up")
                    })
                    .padding(.top, 20)
            }
            .offset(y: -60)
            .padding()
            .navigationTitle("SignIn")
            .accentColor(Color(.label))
        }
        
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SignInView()
                
        }
    }
}

struct LoginButton: View {
    var body: some View {
        Text("LOGIN")
            .bold()
            .frame(width: 280, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
