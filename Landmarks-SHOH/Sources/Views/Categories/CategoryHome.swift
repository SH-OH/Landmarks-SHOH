//
//  CategoryHome.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/04/29.
//

import SwiftUI

struct CategoryHome: View {
    private struct Constants {
        static let navigationTitle: String = "Featured"
        static let profileImage: String = "person.crop.circle"
        static let profileAccessiblityText: String = "User Profile"
    }
    
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                PageView(pages: modelData.features.map { FeatureCard(landmark: $0) })
                    .aspectRatio(3 / 2, contentMode: .fit)
                    .listRowInsets(.init())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    if let landmarks = modelData.categories[key] {
                        CategoryRow(categoryName: key, items: landmarks)
                    }
                }
                .listRowInsets(.init())
            }
            .listStyle(InsetListStyle())
            .navigationTitle(Constants.navigationTitle)
            .toolbar(content: {
                Button(action: { showingProfile.toggle() }, label: {
                    Image(systemName: Constants.profileImage)
                        .accessibilityLabel(Constants.profileAccessiblityText)
                })
            })
            .sheet(isPresented: $showingProfile, content: {
                ProfileHost()
                    .environmentObject(modelData)
            })
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(ModelData())
    }
}
