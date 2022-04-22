//
//  DetailViewModel.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 22.04.2022.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
  
  private let coinDetailService: CoinDetailDataService
  private var cancellables = Set<AnyCancellable>()
  
  init(coin: CoinModel) {
    self.coinDetailService = CoinDetailDataService(coin: coin)
    self.addSubscribers()
  }
  
  private func addSubscribers() {
    
    coinDetailService.$coinDetails
      .sink { [weak self] (returnedCoinDetails) in
        print("RECIVED COIN DETAIL DATA")
        print(returnedCoinDetails)
      }
      .store(in: &cancellables)
  }
}
