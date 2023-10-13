//
//  MealsView.swift
//  Prepped
//
//  Created by Daniel Priestley on 12/10/2023.
//

import SwiftUI

struct MealsView: View {
    @State private var searchText = ""
    @State private var isSearching = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(1...20, id: \.self) { _ in
                        Text("Meal")
                    }
                }
            }
            .navigationTitle("Meals")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(
                Color.primaryFlipped
            )
            
            .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .automatic)
            )
        }
    }
}

#Preview {
    MealsView()
}
