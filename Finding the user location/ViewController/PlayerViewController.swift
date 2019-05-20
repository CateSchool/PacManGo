//
//  PlayerViewController.swift
//  Finding the user location
//
//  Created by Charles Xie on 5/3/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
   
    let basicInfo = playerBasicInfo()
    

    
    var data = ""
    
    /*
     
     var gameStatue = false
     var playerNumber = false
 */

    override func viewDidLoad() {
        super.viewDidLoad()

        let firstPlayer = basicInfo.player1
    
        let secondPlayer = basicInfo.player2
        
        let thirdPlayer = basicInfo.player3
        
        allPlayerInformation.text = "\(firstPlayer.name)" + "\(firstPlayer.type)" +  "\n \(secondPlayer.name)" + "\(secondPlayer.type)" +
            "\n \(thirdPlayer.name)" +
            "\(thirdPlayer.type)"
    }
    //This is function is to display the different players and their roles in the Player View Controller. Each player would be able to see other players in the game.

    @IBOutlet weak var rolePicture: UIImageView!
    
    
  
    @IBOutlet weak var allPlayerInformation: UILabel!
    

    @IBAction func joinMainGamePage(_ sender: UIButton) {
        performSegue(withIdentifier: "toMainGame", sender: self)
    }
   //Pressing this button would transfer one from the player page to the Main Game page.
    
    


}

