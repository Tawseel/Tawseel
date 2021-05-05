//
//  Item.swift
//  Tawseel
//
//  Created by Obaida Kata on 03/05/2021.
//

import Foundation
import SwiftUI
import CoreLocation


struct Item: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var category: String
    var imagePath: String
}
