//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 14.04.2022.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
          NavigationView {
            HomeView()
              .navigationBarHidden(true)
          }
        }
    }
}
