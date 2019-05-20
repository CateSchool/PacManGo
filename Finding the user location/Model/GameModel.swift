//
//  GameModel.swift
//  Finding the user location
//
//  Created by cloris cheng on 4/20/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import Foundation

//struct for the different possible powerups
struct PowerUps {
    var canEatGhost: Bool = false
}
//struct that hold the different values of the game status
struct GameStatus {
    var iBeaconUUID: String = ""
    var started: Bool = false
    var timeElapsed: Double = 0 // time in milliseconds
}
//Struct that holds the different values of the player inluding location, user ID, alive/dead, and what powerups they have
struct AdvancedPlayerInfo {
    var userID: String = ""
    var latitude: Double = 0
    var longitude: Double = 0
    var role: String  = "" // either "ghost" or "pacman"
    var alive: String = ""
    var powerUps: PowerUps = PowerUps()

    
    }

//this gameState struct contains the master information for player and game state.
struct GameState {
    var playerStates: [AdvancedPlayerInfo] = []
    var gameStatus: GameStatus = GameStatus()
}

//dummy data to display on the Game view controller. This code should be placed in the game view controller.
class playerBasicInfo {
    let player1 = Player(name: "JSON", initialTime: 0, type: "PacMan", power: "")
    let player2 = Player(name: "Jason", initialTime: 0, type: "Ghost", power: "")
    let player3 = Player(name: "Ronnie", initialTime: 0, type: "Ghost", power: "")
}




