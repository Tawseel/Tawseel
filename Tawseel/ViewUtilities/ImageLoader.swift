//
//  ImageLoader.swift
//  Tawseel
//
//  Created by Obaida Kata on 04/05/2021.
//

import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    var didChange = PassthroughSubject<Image, Never>()
    
    @Published var image = Image(uiImage: UIImage(named: "steak")!){
        didSet {
            didChange.send(image)
        }
    }
    
    public func loadImage(imageUrl: String) -> Image {
        guard let url = URL(string: imageUrl) else {return image}
        
        URLSession.shared.dataTask(with: url){ (data, _, _) in
            guard let data = data else {return}
            
            DispatchQueue.main.async {
                if(data.count > 0){
                    self.image = Image(uiImage: UIImage(data: data)!)
                }
            }
        }.resume()
        
        return image
    }

}
