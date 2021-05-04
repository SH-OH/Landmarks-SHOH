//
//  CategoryHome.swift
//  Landmarks-SHOH
//
//  Created by Oh Sangho on 2021/04/29.
//

import SwiftUI

struct CategoryHome: View {
    @EnvironmentObject var modelData: ModelData
    @State private var showingProfile: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                modelData.features[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(.init())
                
                ForEach(modelData.categories.keys.sorted(), id: \.self) { key in
                    if let landmarks = modelData.categories[key] {
                        CategoryRow(categoryName: key, items: landmarks)
                    }
                }
                .listRowInsets(.init())
            }
            .listStyle(InsetListStyle())
            .navigationTitle("Featured")
            .toolbar(content: {
                Button(action: { showingProfile.toggle() }, label: {
                    Image(systemName: "person.crop.circle")
                        .accessibilityLabel("User Profile")
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
