//
//  GamePlayViewController.swift
//  Finding the user location
//
//  Created by keck on 5/3/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import UIKit




class GamePlayViewController: UIViewController {
    let currentPlayer = "Alice"
    let currentTimeMillis = 0
    
    let gameState = GameState()
    
    @IBOutlet weak var PlayersTableView: UITableView!
    @IBOutlet weak var MapView: MKMapView!
    
    
    func render() {
        
    }
}
