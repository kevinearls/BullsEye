//
//  TextViews.swift
//  Bullseye
//
//  Created by Kevin Earls on 04/12/2023.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColor"))
      .bold()
      .multilineTextAlignment(.center)
      .lineSpacing(4.0)
      .font(.footnote)
      .kerning(2.0)
  }
}

struct BigNumberText: View {
  var number: String
  
  var body: some View {
    Text(number)
      .foregroundColor(Color("TextColor"))
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
  }
}

struct LabelText: View {
  var text:String
  
  var body: some View {
    Text(text.uppercased())
      .kerning(1.5)
      .font(.caption)
      .bold()
      .foregroundColor(Color("TextColor"))
  }
}

struct BodyText: View {
  var text:String

  var body: some View {
    Text(text)
      .multilineTextAlignment(.center)
      .font(.subheadline)
      .fontWeight(.semibold)
      .lineSpacing(12)
  }
}

struct ButtonText: View {
  var text:String

  var body: some View {
    Text(text)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.accentColor)
      .foregroundColor(.white)
      .cornerRadius(12)
  }
}

#Preview {
  VStack {
    InstructionText(text: "Instructions go here")
    BigNumberText(number: "69")
    LabelText(text: "Score")
    BodyText(text: "You scored 200 points!\n 😻😻😻 ")
    ButtonText(text: "Start new round")
  }
  .padding()
}
