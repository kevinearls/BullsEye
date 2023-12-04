//
//  RoundedViews.swift
//  Bullseye
//
//  Created by Kevin Earls on 04/12/2023.
//

import SwiftUI

struct RoundedImageViewStroked: View {
  var systemName:String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("TextColor"))
      .frame(width: 56, height: 56)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2)
      )
  }
}

struct RoundedImageViewFilled: View {
  var systemName:String

  var body: some View {
    Image(systemName: systemName)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColor"))
      .frame(width: 56, height: 56)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColor"))
      )
  }
}

struct PreviewView: View {
  var body: some View {
    HStack {
      RoundedImageViewFilled(systemName: "arrow.counterclockwise")
      Spacer()
      RoundedImageViewStroked(systemName: "list.dash")
    }
    RoundedRectTextView(text: "999")
  }
}

struct RoundedRectTextView: View {
  var text: String

  var body: some View {
    Text(text)
      .kerning(-0.2)
      .bold()
      .font(.title3)
      .frame(width: 68, height: 56)
      .foregroundColor(Color("TextColor"))
      .overlay (
        RoundedRectangle(cornerRadius: 201)
          .stroke(lineWidth: 2)
          .foregroundColor(Color("ButtonStrokeColor"))      )
  }
}

#Preview {
  PreviewView()
}

#Preview {
  PreviewView()
    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
