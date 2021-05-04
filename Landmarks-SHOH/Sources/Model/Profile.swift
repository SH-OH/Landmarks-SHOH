//
//  Profile.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/05/05.
//

import Foundation

struct Profile {
    var username: String
    var prefersNotifications: Bool = true
    var seasonalPhoto: Season = .winter
    var goalDate: Date = .init()
    
    static let `default` = Profile(username: "SH-OH")
    
    enum Season: String, CaseIterable, Identifiable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id: String { self.rawValue }
    }
}
