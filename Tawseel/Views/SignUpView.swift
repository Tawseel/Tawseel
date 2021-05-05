//
//  SignUpView.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct SignUpView: View {
    @State var firstName = ""
    @State var lastName = ""
    @State var password = ""
    @State var passwordAgain = ""
    
    var body: some View {
        VStack {
            Form {
                Section{
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                
                Section {
                    SecureField("Create Password", text: $password)
                    SecureField("Confirm Password", text: $passwordAgain)
                }
            }
            
            Button(action: {}, label: {
                Text("Sign Up")
                    .bold()
                    .frame(width: 250, height: 50, alignment:  .center)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
            })
            .padding()
        }
//        .navigationTitle("Create Account")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
