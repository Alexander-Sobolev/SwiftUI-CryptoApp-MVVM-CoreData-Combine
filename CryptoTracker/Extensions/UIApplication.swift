//
//  UIApplication.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 16.04.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
  
  func endEditing() {
    sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
  
}
