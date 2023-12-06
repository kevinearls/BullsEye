//
//  PointsView.swift
//  Bullseye
//
//  Created by Kevin Earls on 05/12/2023.
//

import SwiftUI

struct PointsView: View {
  @Binding var alertIsVisible: Bool
  @Binding var game: Game
  @Binding var sliderValue: Double

  var body: some View {
    let roundedSliderValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedSliderValue)

    VStack(spacing: 10) {
      InstructionText(text: "The Slider's value is")
      BigNumberText(number: String(roundedSliderValue))
      BodyText(text: "You scored \(points) points\n 🤑🤑🤑")
      Button {
        withAnimation {
          alertIsVisible = false
        }
        game.startNewRound(points: points)
      } label: {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColor"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x:5, y:5)
  }
}

#Preview {
  let alertIsVisible = Binding.constant(false)
  let sliderValue = Binding.constant(50.0)
  let game = Binding.constant(Game())

  return PointsView(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
}

#Preview {
  let alertIsVisible = Binding.constant(false)
  let sliderValue = Binding.constant(50.0)
  let game = Binding.constant(Game())

  return PointsView(alertIsVisible: alertIsVisible, game: game, sliderValue: sliderValue)
    .previewInterfaceOrientation(.landscapeRight)
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}

