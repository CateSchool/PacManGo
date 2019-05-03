//
//  GameModel.swift
//  Finding the user location
//
//  Created by cloris cheng on 4/20/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import Foundation


struct PowerUps {
    var canEatGhost: Bool = false
}
struct PlayerState {
    var userID: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var role: String  = "" // either "ghost" or "pacman"
    var alive: String = ""
    var powerUps: PowerUps = PowerUps()
}
struct GameStatus {
    var iBeaconUUID: String = ""
    var started: Bool = false
    var timeElapsed: Double = 0 // time in milliseconds
}
struct GameState {
    var playerStates: [PlayerState] = []
    var gameStatus: GameStatus = GameStatus()
}


