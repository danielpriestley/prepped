//
//  PreppedApp.swift
//  Prepped
//
//  Created by Daniel Priestley on 12/10/2023.
//

import SwiftUI
import UIKit
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

  func application(_ application: UIApplication,

                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

    FirebaseApp.configure()

    return true

  }

}

@main
struct PreppedApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    init() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().isTranslucent = true
        UITabBar.appearance().backgroundColor = UIColor(Color.primaryFlipped)
        UITabBar.appearance().isOpaque = false
       }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
