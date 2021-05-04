//
//  ModelData.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/04/29.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    lazy var hikes: [Hike] = load("hikeData.json")
    @Published var profile: Profile = .default
    
    var features: [Landmark] {
        landmarks.filter { $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("\(filename) 찾을 수 없음.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("\(filename) 로드할 수 없음.:\n \(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("\(filename) as \(T.self) 파싱 실패.:\n \(error)")
    }
}
