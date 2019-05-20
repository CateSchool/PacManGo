//
//  PlayerModel.swift
//  Finding the user location
//
//  Created by cloris cheng on 4/20/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import Foundation

class Player {
    var initialTime: Int = 0
    var type: String
    var name: String
    var power: String = ""
    
    init(name: String, initialTime: Int, type: String, power: String) {
        self.name = name
        self.initialTime = initialTime
        self.type = type
        self.power = power
    }
    
}
//this class contains the different values of the player, though it is sort of repititious with what we have in the gameModel.
