//
//  SignUpView.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct SignUpView: View {
    @ObservedObject var loginModel = AppManager.Instance.loginModel
    @State var client = ClientDetails()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    var body: some View {
        VStack {
            Form {
                Section{
                    TextField("First Name", text: $client.firstName)
                    TextField("Last Name", text: $client.lastName)
                }
                
                Section {
                    SecureField("Email", text: $client.email)
                    SecureField("Password", text: $client.password)
                }
            }
            
            Button(action: {
                self.onSignUpSucess(isSucess: true);
//                loginModel.signUp(client: client, action: onSignUpSucess)
                
            }, label: {
                LoginButton(text: "Sign up")
                
            })
            .padding()
        }
    }
    
    func onSignUpSucess(isSucess: Bool) {
        if(isSucess) {
            self.mode.wrappedValue.dismiss()
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
