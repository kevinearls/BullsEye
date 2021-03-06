//
//  BullsEyeView.swift
//  BullsEye
//
//  Created by Kevin Earls on 20/01/2022.
//

import SwiftUI

struct BullsEyeView: View {
    @State private var alertIsVisible = false 
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackGroundView(game: $game)
            VStack {
                InstructionsView(game: $game).padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                        .transition(.scale)
                } else {
                HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                    .transition(.scale)
            }
            if !alertIsVisible {
                SliderView(sliderValue: $sliderValue).transition(.scale)
            }
            }
        }
    }
    
    struct InstructionsView: View {
        @Binding var game: Game
        
        var body: some View {
            VStack {
                InstructionsText(text: "🎯 🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN TO")
                BigNumberText(text: String(game.target))
            }
        }
    }
    
    struct SliderView: View {
        @Binding var sliderValue: Double
        
        var body: some View {
            HStack {
                SliderLabelText(text: "1")
                Slider(value: self.$sliderValue, in:1.0...100.0)
                SliderLabelText(text: "100")
            }
            .padding()
        }
    }
    
    struct HitMeButton: View {
        @Binding var alertIsVisible: Bool
        @Binding var sliderValue: Double
        @Binding var game: Game
        
        var body: some View {
            Button(action: {
                withAnimation {
                    alertIsVisible = true
                }
                //game.startNewRound(points: game.points(sliderValue: Int(sliderValue)))
            }) {
              Text("Hit me".uppercased())
                .bold()
                .font(.title3)
            }
              .padding(20.0)
              .background(
                ZStack {
                  Color("ButtonColor")
                  LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
                }
              )
              .foregroundColor(Color.white)
              .cornerRadius(21.0)
              .overlay(RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
                        .strokeBorder(Color.white, lineWidth: Constants.General.strokeWidth))
          }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BullsEyeView().preferredColorScheme(.dark)
                //BullsEyeView()
                //    .previewLayout(.fixed(width: 568, height: 320))
                //BullsEyeView()
                //    .preferredColorScheme(.dark)
                //BullsEyeView()
                //    .preferredColorScheme(.dark)
                //    .previewLayout(.fixed(width: 568, height: 320))
    }
}
