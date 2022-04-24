//
//  String.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 24.04.2022.
//

import Foundation

extension String {
  
  
  var removingHTMLOccurances: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
  }
  
}
