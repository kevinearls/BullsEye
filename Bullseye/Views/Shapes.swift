//
//  Shapes.swift
//  Bullseye
//
//  Created by Kevin Earls on 04/12/2023.
//

import SwiftUI

struct Shapes: View {
  var body: some View {
    VStack {
      Circle()
        .strokeBorder(Color.blue, lineWidth: 20.0)
        .frame(width: 200, height: 100)
        .background(Color.green)
    }
    RoundedRectangle(cornerRadius: 20.0)
      .fill(Color.blue)
      .frame(width: 200, height: 100)
    Capsule()
      .fill(Color.blue)
      .frame(width: 200, height: 100)
    Ellipse()
      .fill(Color.blue)
      .frame(width: 200, height: 100)
  }
}

#Preview {
  Shapes()
}
