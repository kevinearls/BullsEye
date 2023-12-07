//
//  Game.swift
//  Bullseye
//
//  Created by Kevin Earls on 01/12/2023.
//

import Foundation

struct Game {
  var target = Int.random(in: 1...100)
  var score = 0
  var round = 1
  var leaderBoardEntries: [LeaderBoardEntry] = []

  init(loadTestData: Bool = false) {
      if loadTestData {
        addToLeaderBoard(points: 100)
        addToLeaderBoard(points: 80)
        addToLeaderBoard(points: 88)
        addToLeaderBoard(points: 200)
        addToLeaderBoard(points: 50)
        addToLeaderBoard(points: 20)
      }
    }

  mutating func restart() {
    target = Int.random(in: 1...100)
    score = 0
    round = 1
  }
  
  func points(sliderValue:Int) -> Int {
    var pointsScored = 100 - abs(target - sliderValue)
    if (pointsScored == 100) {
      pointsScored += 100
    } else if pointsScored >= 98 {
      pointsScored += 50
    }

    return pointsScored
  }

  mutating func addToLeaderBoard(points: Int) {
    leaderBoardEntries.append(LeaderBoardEntry(score: points, date: Date()))

    leaderBoardEntries.sort { entry1, entry2 in
      entry1.score > entry2.score
    }
  }

  mutating func startNewRound(points: Int) {
    addToLeaderBoard(points: points)
    score += points
    round += 1
    target = Int.random(in: 1...100)
  }
}


struct LeaderBoardEntry {
  let score: Int
  let date: Date
}
