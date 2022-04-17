//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 14.04.2022.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
  
  @StateObject private var vm = HomeViewModel()
  
  init() {
    UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
  }
  
    var body: some Scene {
        WindowGroup {
          NavigationView {
            HomeView()
              .navigationBarHidden(true)
          }
          .environmentObject(vm)
        }
    }
}
