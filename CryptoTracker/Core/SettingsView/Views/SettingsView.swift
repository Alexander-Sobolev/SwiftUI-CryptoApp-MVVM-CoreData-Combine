//
//  SettingsView.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 24.04.2022.
//

import SwiftUI

struct SettingsView: View {
  @Environment(\.presentationMode) var presentationMode
  let defaultURL = URL(string: "https://www.google.com")
  let gitHubURL = URL(string: "https://github.com/Alexander-Sobolev")
  let coingeckoURL = URL(string: "https://www.coingecko.com")

  var body: some View {
    NavigationView {
      ZStack {
        // background
        Color.theme.background
          .ignoresSafeArea()
        
        // content
        List {
          descriptionSection
            .listRowBackground(Color.theme.background.opacity(0.5))
          coinGeckoSection
            .listRowBackground(Color.theme.background.opacity(0.5))
          developerSection
            .listRowBackground(Color.theme.background.opacity(0.5))
          applicationSection
            .listRowBackground(Color.theme.background.opacity(0.5))
        }
      }
      .font(.headline)
      .accentColor(.blue)
      .listStyle(GroupedListStyle())
      .navigationTitle("Settings")
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          Button(action: {
            presentationMode.wrappedValue.dismiss()
          }, label: {
            Image(systemName: "xmark")
              .font(.headline)
          })
        }
      }
    }
  }
}

struct SettingsView_Previews: PreviewProvider {
  static var previews: some View {
    SettingsView()
  }
}

extension SettingsView {
  
  private var descriptionSection: some View {
    Section(header: Text("Description Section")) {
      VStack(alignment: .leading) {
        Image("logo")
          .resizable()
          .frame(width: 100, height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text("This app uses MVVM Architecture, Combine, and CoreData!")
          .font(.callout)
          .fontWeight(.medium)
          .foregroundColor(Color.theme.accent)
      }
      .padding(.vertical)
      if let gitHubURL = gitHubURL, let defaultURL = defaultURL {
      Link("GitHub", destination: gitHubURL)
      Link("Support url ☕️", destination: defaultURL)
      }
    }
  }
  
  private var coinGeckoSection: some View {
    Section(header: Text("CoinGecko")) {
      VStack(alignment: .leading) {
        Image("coingecko")
          .resizable()
          .scaledToFit()
          .frame(height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko! Prices may be slightly delayed.")
          .font(.callout)
          .fontWeight(.medium)
          .foregroundColor(Color.theme.accent)
      }
      .padding(.vertical)
      if let coingeckoURL = coingeckoURL {
      Link("Visit CoinGecko 🦎", destination: coingeckoURL)
      }
    }
  }
  
  private var developerSection: some View {
    Section(header: Text("Developer")) {
      VStack(alignment: .leading) {
        Image("logo")
          .resizable()
          .frame(width: 100, height: 100)
          .clipShape(RoundedRectangle(cornerRadius: 20))
        Text("This app uses SwiftUI and is written 100% in Swift. The project benefits from multi-threading, publishers/subscribers, and data persistance. Special thanks to Nick Sarno")
          .font(.callout)
          .fontWeight(.medium)
          .foregroundColor(Color.theme.accent)
      }
      .padding(.vertical)
      if let gitHubURL = gitHubURL {
        Link("Support url ❤️", destination: gitHubURL)
    }
    }
  }
  
  private var applicationSection: some View {
    Section(header: Text("Application")) {
      if let defaultURL = defaultURL {
      Link("Terms of Service", destination: defaultURL)
      Link("Privacy Policy", destination: defaultURL)
      Link("Company Website", destination: defaultURL)
      Link("Learn More", destination: defaultURL)
      }
    }
  }
  
  
}

