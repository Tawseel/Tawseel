//
//  SettingsCell.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import SwiftUI

struct SettingsCell: View {
    @Environment(\.colorScheme) var colorScheme
    
    var title: String
    var imageName: String
    var color: Color

    var body: some View {
        HStack {
            Image(systemName: imageName)
                .font(.headline)
                .foregroundColor(color)
            
            Text(title)
                .font(.headline)
                .padding(.leading, 10)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .font(.headline)
                .foregroundColor(.gray)
                
            .foregroundColor(colorScheme == .dark ? .white : .black)
        }
    }
}

struct SettingsCell_Previews: PreviewProvider {
    static var previews: some View {
        SettingsCell(title: "Features", imageName: "sparks", color: .purple)
            
    }
}
