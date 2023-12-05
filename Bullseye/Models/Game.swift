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

  mutating func startNewRound(points: Int) {
    score += points
    round += 1
    target = Int.random(in: 1...100)
  }
}
