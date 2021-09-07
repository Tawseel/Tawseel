//
//  ContentView.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0)

struct SignInView: View {
    @State var username = "obaida2@gmail.com"
    @State var password = "obaida1234"
    @ObservedObject var loginModel = AppManager.Instance.loginModel
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            TextField("Username", text: $username)
                .padding()
                .border(colorScheme == .dark ? Color.white : Color.black)
                .cornerRadius(5.0)

                
            
            SecureField("Password", text: $password)
                .padding()
                .border(colorScheme == .dark ? Color.white : Color.black)
                .cornerRadius(5.0)
                .padding(.bottom, 40)
                
            
            
            LoginButton(text: "LOGIN")
                .onTapGesture {
                    signIn()
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
    
    func signIn() {
        if !username.isEmpty && !password.isEmpty{
            let logInCredentials = LogInCredentials(email: username, password: password)
            loginModel.login(logInCredentials: logInCredentials)
        }
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
    var text: String
    var body: some View {
        Text(text)
            .bold()
            .frame(width: 280, height: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
