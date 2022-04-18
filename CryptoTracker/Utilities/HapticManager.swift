//
//  HapticManager.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 18.04.2022.
//

import Foundation
import SwiftUI

class HapticManager {
  
  static private let generator = UINotificationFeedbackGenerator()
  
  static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
    generator.notificationOccurred(type)
  }
  
}
