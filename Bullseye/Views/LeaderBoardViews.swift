//
//  LeaderBoardViews.swift
//  Bullseye
//
//  Created by Kevin Earls on 06/12/2023.
//

import SwiftUI

struct ScoreTextView: View {  // TODO move to TextViews
  var score: Int

  var body: some View {
    Text(String(score))
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
      //.frame(width: Constants.LeaderBoard.scoreColumnWidth)
  }
}

struct DateTextView: View { // TODO move to textViews
  var date: Date

  var body : some View {
    return Text(date, style: .time)
      .bold()
      .kerning(-0.2)
      .foregroundColor(Color("TextColor"))
      .font(.title3)
  }
}

struct RoundedTextView: View {  // TODO: move to RoundedViews
  var text: String

  var body : some View {
    Text(text)
      .bold()
      .font(.title3)
      .foregroundColor(Color("TextColor"))
      .frame(width: Constants.LeaderBoard.scoreColumnWidth, height:  Constants.LeaderBoard.scoreColumnWidth)
      .overlay (
        Circle()
          .stroke(lineWidth: Constants.General.strokeWidth)
          .foregroundColor(Color("LeaderBoardRowColor"))
      )

  }
}

struct HeaderView: View {
  @Binding var leaderBoardIsShowing: Bool
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass

  var body: some View {
    ZStack {
      HStack {
        BigBoldText(text: "LeaderBoard")
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          Spacer()
        }
      }

      HStack {
        Spacer()
        Button {
          leaderBoardIsShowing = false
        } label: {
          RoundedImageViewFilled(systemName: "xmark")      }
        }
    }
    .padding([.horizontal, .top])
  }
}

struct LabelView: View {
  var body : some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score")
        .frame(width: Constants.LeaderBoard.scoreColumnWidth)
      Spacer()
      LabelText(text: "Date")
        .frame(width: Constants.LeaderBoard.dateColumnWidth)
    }
    .padding(.horizontal)
    .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
  }
}

struct RowView: View {
  let index: Int
  let score: Int
  let date: Date

  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
      Spacer()
      ScoreTextView(score: score)
        .frame(width: Constants.LeaderBoard.scoreColumnWidth)
      Spacer()
      DateTextView(date: date)
        .frame(width: Constants.LeaderBoard.dateColumnWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderBoardRowColor"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.horizontal)
    .frame(maxWidth: Constants.LeaderBoard.maxRowWidth)
  }
}

struct LeaderBoardView: View {
  @Binding var leaderBoardIsShowing: Bool
  @Binding var game: Game

  var body : some View {
    ZStack {
      Color("BackgroundColor").ignoresSafeArea()
      ScrollView {
        VStack(spacing: 10) {
          HeaderView(leaderBoardIsShowing: $leaderBoardIsShowing)
          LabelView()
          VStack (spacing: 10 ){
            ForEach(game.leaderBoardEntries.indices, id: \.self) { index in
              let leaderBoardEntry = game.leaderBoardEntries[index]
              RowView(index: index + 1, score: leaderBoardEntry.score, date: leaderBoardEntry.date)
            }
          }
        }
      }
    }
  }
}

#Preview {

  LeaderBoardView(leaderBoardIsShowing: .constant(false), game: .constant(Game(loadTestData: true)))
    .previewInterfaceOrientation(.landscapeRight)
}

//#Preview {
//  //var leaderboardIsShowing = Binding.constant(false)
//  LeaderBoardView(leaderBoardIsShowing: .constant(false), game: .constant(Game()))
//    .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
//}
