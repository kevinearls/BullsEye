//
//  PointsView.swift
//  Bullseye
//
//  Created by Kevin Earls on 05/12/2023.
//

import SwiftUI

struct PointsView: View {
  var game: Game
  var sliderValue: Double

  var body: some View {
    VStack(spacing: 10) {
      InstructionText(text: "The Slider's value is")
      BigNumberText(number: String(sliderValue))  // TODO Fix
      BodyText(text: "You scored \(game.points(sliderValue: Int(sliderValue))) points\n 🤑🤑🤑")
      Button {
        // TODO start new round
      } label: {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(21)
    .shadow(radius: 10, x:5, y:5)
  }
}

#Preview {
  PointsView(game: Game(), sliderValue: 42.0)
}

#Preview {
  PointsView(game: Game(), sliderValue: 42.0)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    .previewInterfaceOrientation(.landscapeRight)
}

