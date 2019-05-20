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

struct GameStatus {
    var iBeaconUUID: String = ""
    var started: Bool = false
    var timeElapsed: Double = 0 // time in milliseconds
}
struct AdvancedPlayerInfo {
    var userID: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var role: String  = "" // either "ghost" or "pacman"
    var alive: String = ""
    var powerUps: PowerUps = PowerUps()

//info that gets send to the server
        
    }


struct GameState {
    var playerStates: [AdvancedPlayerInfo] = []
    var gameStatus: GameStatus = GameStatus()
}


class playerBasicInfo {
    let player1 = Player(name: "JSON", initialTime: 0, type: "PacMan", power: "")
    let player2 = Player(name: "Jason", initialTime: 0, type: "Ghost", power: "")
    let player3 = Player(name: "Ronnie", initialTime: 0, type: "Ghost", power: "")
}




