//
//  StoreHome.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import SwiftUI
import Combine

struct TawseelView: View {
    var modelData: ModelData
    init(modelData : ModelData){
        self.modelData = modelData
    }
    
    var body: some View {
        TabView {
            HomeView(modelData: modelData)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
                
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarTitle("Tawssel", displayMode: .inline)
    }
    
}

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Image, Never>()
    
    @Published var image = Image(uiImage: UIImage(named: "steak")!){
        didSet {
            didChange.send(image)
        }
    }
    
    init(imageUrl: String) {
        guard let url = URL(string: imageUrl) else {return}
        
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                if(data.count > 0){
                    self.image = Image(uiImage: UIImage(data: data)!)
                }
            }
        }.resume()
    }
}

struct StoreHome_Previews: PreviewProvider {
    static var previews: some View {
        TawseelView(modelData: ModelData())
    }
}
