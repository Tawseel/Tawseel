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
    var email: String
    var password: String
    var isFeatured: Bool
    var description: String
    var imagePath: String
    
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case burgers = "Burgers"
        case amirican = "Amirican"
        case indian = "Indian"
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude)
    }

    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
