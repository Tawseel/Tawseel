//
//  Settings.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        VStack {

            List {
                Section {
                    Button(action: {
                        self.showFeatures()
                    }
                    , label: {
                        SettingsCell(title: "Features", imageName: "sparkles", color: .purple)
                            
                            
                    })
                }
                
                Section {
                    Button(action: {
                        self.showFeatures()
                    }
                    , label: {
                        SettingsCell(title: "Write vkifv",
                                     imageName: "sparkles",
                                     color: .purple)
                    })
                    Button(action: {
                        self.showFeatures()
                    }
                    , label: {
                        SettingsCell(title: "Write vkifv", imageName: "sparkles", color: .purple)
                    })
                }
                
                Section {
                    NavigationLink(destination: SignInView()) {
                        SettingsCell(title: "Log out", imageName: "sparkles", color: .purple)
                    }
                    
                }
            }.listStyle(GroupedListStyle())
            .environment(\.horizontalSizeClass, .regular)
        
        }
        .navigationBarTitle("Settings")
    }
    
    func showFeatures() {
        print("Show user Features")
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
