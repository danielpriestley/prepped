//
//  PreppedTabView.swift
//  Prepped
//
//  Created by Daniel Priestley on 12/10/2023.
//

import SwiftUI

struct PreppedTabView: View {
    @State private var selectedTab = 0
    @State private var isPresenting = false
    @State private var oldTab = 0
    @State private var meal = Meal()
    @State private var sheetDetents = PresentationDetent.height(300)
    
    
    
    var body: some View {
        TabView(selection: $selectedTab) {
            MealsView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "carrot.fill" : "carrot")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none )
                }
                .onAppear {
                    selectedTab = 0
                    oldTab = selectedTab
                }
                .tag(0)
            
            Text("Planner View")
                .tabItem {
                    Image(systemName: "calendar")
                }
                .onAppear { 
                    selectedTab = 1
                    oldTab = selectedTab
                }
                .tag(1)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear {
                    let haptic = UIImpactFeedbackGenerator(style: .light)  // create a haptic feedback generator with a light style
                    haptic.impactOccurred()  // trigger the haptic feedback
                    selectedTab = oldTab
                    isPresenting = true
                    
                }
                .tag(2)
            
            Text("Shopping View")
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "basket.fill" : "basket")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none )
                }
                .onAppear {
                    selectedTab = 3
                    oldTab = selectedTab
                }
                .tag(3)
            
            AccountView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none )
                }
                .onAppear {
                    selectedTab = 4
                    oldTab = selectedTab
                }
                .tag(4)
        }
        .tint(.primary)
        
        
        
        .sheet(isPresented: $isPresenting) {
                CreateView(sheetDetents: $sheetDetents)
                .presentationDetents([.height(300), .large], selection: $sheetDetents)
                .onDisappear{
                    self.sheetDetents = PresentationDetent.height(300)
                }
        }
        
        
    }
}

#Preview {
    PreppedTabView()
}
