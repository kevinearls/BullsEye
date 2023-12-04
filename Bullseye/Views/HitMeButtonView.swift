//
//  HitMeButtonView.swift
//  Bullseye
//
//  Created by Kevin Earls on 04/12/2023.
//

import SwiftUI

struct HitMeButtonView: View {
  @Binding var alertIsVisible:Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
    var body: some View {
      Button("Hit me!".uppercased()) {
        alertIsVisible = true
      }
      .padding(20.0)
      .background(
        ZStack {
          Color("ButtonColor")
          LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
        }
      )
      .overlay(
        RoundedRectangle(cornerRadius: 21.0)
          .strokeBorder(Color.white, lineWidth: 5.0)
      )
      .foregroundColor(.white)
      .cornerRadius(21.0)
      .bold()
      .font(.title3)
      .alert(
        "Hello there!",
        isPresented: $alertIsVisible,
        actions: {
          Button("Awesome!") {
            print("Alert is closed")
          }
        },
        message: {
          let roundedValue = Int(sliderValue.rounded())
          Text("""
The slider's value is now \(roundedValue)
You scored \(game.points(sliderValue: roundedValue)) points this round
""")
        })
    }
}

#Preview {
  HitMeButtonView(alertIsVisible: .constant(false), sliderValue: .constant(42.0), game: .constant(Game()))
}
