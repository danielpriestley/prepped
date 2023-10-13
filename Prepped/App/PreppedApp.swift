//
//  PreppedApp.swift
//  Prepped
//
//  Created by Daniel Priestley on 12/10/2023.
//

import SwiftUI
import UIKit

@main
struct PreppedApp: App {
    init() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor(Color.primaryFlipped)
        UITabBar.appearance().isOpaque = false
       }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
