//
//  ProfileEditor.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/05/05.
//

import SwiftUI

struct ProfileEditor: View {
    private struct Constants {
        static let usernameTitle: String = "Username"
        static let notificationsTitle: String = "Enable Notifications"
        static let seasonalTitle: String = "Seasonal Photo"
        static let goalDateTitle: String = "Goal Date"
    }
    @Binding var profile: Profile
    
    var dateRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: profile.goalDate) ?? Date()
        let max = Calendar.current.date(byAdding: .year, value: 1, to: profile.goalDate) ?? Date()
        return min...max
    }
    
    var body: some View {
        List {
            HStack {
                Text(Constants.usernameTitle).bold()
                Divider()
                TextField(Constants.usernameTitle, text: $profile.username)
            }
            
            Toggle(isOn: $profile.prefersNotifications, label: {
                Text(Constants.notificationsTitle).bold()
            })
            
            VStack(alignment: .leading, spacing: 20, content: {
                Text(Constants.seasonalTitle).bold()
                
                Picker(Constants.seasonalTitle, selection: $profile.seasonalPhoto) {
                    ForEach(Profile.Season.allCases) { season in
                        Text(season.rawValue).tag(season)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            })
            
            DatePicker(selection: $profile.goalDate, in: dateRange) {
                Text(Constants.goalDateTitle).bold()
            }
        }
    }
}

struct ProfileEditor_Previews: PreviewProvider {
    static var previews: some View {
        ProfileEditor(profile: .constant(.default))
    }
}
