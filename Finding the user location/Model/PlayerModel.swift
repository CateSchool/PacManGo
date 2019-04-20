//
//  PlayerModel.swift
//  Finding the user location
//
//  Created by cloris cheng on 4/20/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import Foundation

class Player {
    init(initialTime: Date, type: String) {
        self.initialTime = initialTime
        self.type = type
        
    }
    
    var initialTime: Date
    var type: String
}
