//
//  Hike.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/04/29.
//

import Foundation

struct Hike: Decodable, Hashable, Identifiable {
    let id: Int
    let name: String
    let distance: Double
    let difficulty: Int
    let observations: [Observation]
    
    static let formatter: LengthFormatter = .init()
    var distanceText: String {
        Hike.formatter
            .string(fromValue: distance, unit: .kilometer)
    }
    
    struct Observation: Decodable, Hashable {
        let distanceFromStart: Double
        let elevation: Range<Double>
        let pace: Range<Double>
        let heartRate: Range<Double>
    }
}
