//
//  ModelData.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var stores: [StoreDetails] = load("stores.json")
    
    var features: [StoreDetails] {
            stores.filter { $0.isFeatured }
        }

    var categories: [String: [StoreDetails]] {
        Dictionary(
            grouping: stores,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    print("Error")
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }

    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
