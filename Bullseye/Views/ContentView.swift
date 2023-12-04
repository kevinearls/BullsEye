//
//  ContentView.swift
//  Bullseye
//
//  Created by Kevin Earls on 30/11/2023.
//

import SwiftUI

struct ContentView: View {
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()

  var body: some View {
    ZStack {
      Color("BackgroundColor")
        .ignoresSafeArea()
      VStack {
        InstructionsView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
      }
    }
  }
}

struct InstructionsView : View {
  @Binding var game: Game
  var body : some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to".uppercased())
        .padding(.horizontal, 30)
      BigNumberText(number: String(game.target))
    }
  }
}

#Preview {
  ContentView()
}

#Preview {
  ContentView()
    .previewDevice("iPhone 12 Mini")
    .preferredColorScheme(.dark)
}
