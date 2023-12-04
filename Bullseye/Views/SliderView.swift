//
//  SliderView.swift
//  Bullseye
//
//  Created by Kevin Earls on 04/12/2023.
//

import SwiftUI

struct SliderView: View {
  @Binding var sliderValue: Double
    var body: some View {
      HStack {
        SliderLabelText(text: "1")
          .frame(width: 35)
        Slider(value: $sliderValue, in: 1.0...100.0)
        SliderLabelText(text: "100")
          .frame(width: 35)
      }
      .padding()
    }
}

#Preview {
  SliderView(sliderValue: .constant(89.0))
}
