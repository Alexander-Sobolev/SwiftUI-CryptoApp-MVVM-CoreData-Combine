//
//  HomeView.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 14.04.2022.
//

import SwiftUI

struct HomeView: View {
  
  @State private var showPortfolio: Bool = false
  @EnvironmentObject private var vm: HomeViewModel
  
  var body: some View {
    ZStack {
      
      Color.theme.background
        .ignoresSafeArea()
      VStack {
        homeHeader
        
       columTitles
        
        if !showPortfolio {
        allCoinsList
        .transition(.move(edge: .leading))
      }
        
        if showPortfolio {
          portfolioCoinsList
            .transition(.move(edge: .trailing))
        }
        
        Spacer(minLength: 0)
      }
    }
  }
}

struct HomeView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView{
    HomeView()
        .navigationBarHidden(true)
      
    }
    .environmentObject(dev.homeVM)
  }
}

extension HomeView {
  
  private var homeHeader: some View {
    HStack {
      CircleButtonView(iconName: showPortfolio ? "plus" : "info")
        .animation(.none)
        .background(
          CircleButtonAnimationView(animate: $showPortfolio)
        )
      Spacer()
      Text(showPortfolio ? "Portfolio" : "Live Prices")
        .font(.headline)
        .fontWeight(.heavy)
        .foregroundColor(Color.theme.accent)
        .animation(.none)
      Spacer()
      CircleButtonView(iconName: "chevron.right")
        .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
        .onTapGesture {
          withAnimation(.spring()) {
            showPortfolio.toggle()
          }
        }
    }
    .padding(.horizontal)
  }
  
  private var allCoinsList: some View {
    List {
      ForEach(vm.allCoins) { coin in
        CoinRowView(coin: coin, showHoldingsColumn: false)
          .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
      }
    }
    .listStyle(PlainListStyle())
  }
  
  private var portfolioCoinsList: some View {
    List {
      ForEach(vm.portfolioCoins) { coin in
        CoinRowView(coin: coin, showHoldingsColumn: false)
          .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 0))
      }
    }
    .listStyle(PlainListStyle())
  }
  
  private var columTitles: some View {
    HStack {
      Text("Coin")
      Spacer()
      if showPortfolio {
        Text("Holding")
      }
      Text("Price")
        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
    }
    .font(.caption)
    .foregroundColor(Color.theme.secondaryText)
    .padding(.horizontal)
  }
}
