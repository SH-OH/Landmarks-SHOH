//
//  Landmark.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/04/29.
//

import Foundation
import SwiftUI
import CoreLocation

struct Landmark: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let park: String
    let state: String
    let description: String
    var isFavorite: Bool
    
    private let imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private let coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: coordinates.latitude,
            longitude: coordinates.longitude
        )
    }
    
    private struct Coordinates: Hashable, Decodable {
        let latitude: Double
        let longitude: Double
    }
}
