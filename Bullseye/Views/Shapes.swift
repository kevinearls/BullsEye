//
//  Shapes.swift
//  Bullseye
//
//  Created by Kevin Earls on 04/12/2023.
//

import SwiftUI

struct Shapes: View {
  @State private var wideShapes = false
  var body: some View {
    VStack {
      if !wideShapes {
        Circle()
          .strokeBorder(Color.blue, lineWidth: 20.0)
          .frame(width: 200, height: 100)
          .background(Color.green)
          .transition(.scale)
      } }

    RoundedRectangle(cornerRadius: 20.0)
      .fill(Color.blue)
      .frame(width: wideShapes ? 200 : 100, height: 100)
    Capsule()
      .fill(Color.blue)
      .frame(width: wideShapes ? 200 : 100, height: 100)
    Ellipse()
      .fill(Color.blue)
      .frame(width: wideShapes ? 200 : 100, height: 100)
    Button("Animate!") {
      withAnimation {
        wideShapes.toggle()
      }
    }
  }
}

#Preview {
  Shapes()
}
