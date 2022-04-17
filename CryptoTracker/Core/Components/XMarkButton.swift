//
//  XMarkButton.swift
//  CryptoTracker
//
//  Created by Alexander Sobolev on 17.04.2022.
//

import SwiftUI

struct XMarkButton: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    Button(action: {
      presentationMode.wrappedValue.dismiss()
    }, label: {
      Image(systemName: "xmark")
        .font(.headline)
    })
  }
}

struct XMarkButton_Previews: PreviewProvider {
  static var previews: some View {
    XMarkButton()
  }
}
