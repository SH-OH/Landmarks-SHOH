//
//  ModelData.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/04/29.
//

import Foundation

let landmarks: [Landmark] = load("landmarkData.json")

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
