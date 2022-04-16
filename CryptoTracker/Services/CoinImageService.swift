//
//  CoinImageService.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 16.04.2022.
//

import Foundation
import SwiftUI
import Combine

class CoinImageService {
  
  @Published var image: UIImage? = nil
  
  private var imageSubscription: AnyCancellable?
  private let coin: CoinModel
  private let fileManager = LocalFileManager.instance
  private let folderName = "coin_images"
  private let imageName: String
  
  init(coin: CoinModel) {
    self.coin = coin
    self.imageName = coin.id
    getCoinImage()
  }
  
  private func getCoinImage() {
    if let savedImage = fileManager.getImage(imageName: imageName, folderName: folderName) {
      image = savedImage
//      print("Retrived image from File Manager!") I leave these prints so that in the console you can see how the download works from the network and from the file manager SoboleV
    } else {
      downloadCoinImage()
//      print("Downloading image now") I leave these prints so that in the console you can see how the download works from the network and from the file manager SoboleV
    }
  }
  
  private func downloadCoinImage() {
    guard let url = URL(string: coin.image) else { return }
    
    imageSubscription = NetworkingManager.download(url: url)
      .tryMap({ (data) -> UIImage? in
        return UIImage(data: data)
      })
      .receive(on: DispatchQueue.main)
      .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedImage) in
        guard let self = self, let downloadedImage = returnedImage else { return }
        self.image = downloadedImage
        self.imageSubscription?.cancel()
        self.fileManager.saveImage(image: downloadedImage, imageName: self.imageName, folderName: self.folderName)
      })
  }
}
