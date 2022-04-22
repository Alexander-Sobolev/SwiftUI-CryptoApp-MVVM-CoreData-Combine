//
//  DetailView.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 19.04.2022.
//

import SwiftUI

struct DetailLoadingView: View {
  
  @Binding var coin: CoinModel?
  
  var body: some View {
    ZStack {
      if let coin = coin {
        DetailView(coin: coin)
      }
    }
  }
  
}

struct DetailView: View {
  
  @StateObject private var vm: DetailViewModel
  
  init(coin: CoinModel) {
    _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
    print("Initializing Detail View for \(coin.name)")
  }
  
  var body: some View {
    Text("Hello")
  }
}

struct DetailView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      DetailView(coin: dev.coin)
    }
  }
}
