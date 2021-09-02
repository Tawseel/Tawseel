//
//  Store.swift
//  Tawseel
//
//  Created by Obaida Kata on 22/04/2021.
//

import Foundation
import SwiftUI
import CoreLocation


struct StoreDetails: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var phoneNumber: String
    var isFeatured: Bool
    var description: String
    var imagePath: String
    
    var category: String
    
    private var storeCoordinates: [Coordinates]
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: storeCoordinates.isEmpty ? 50 : storeCoordinates[0].latitude ,
            longitude: storeCoordinates.isEmpty ? 50 : storeCoordinates[0].longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
