//
//  Model.swift
//  Finding the user location
//
//  Created by cloris cheng on 4/1/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

//evaluates the proximity between the user's coordinates and the coordinates of a set location. We figured this will be important to implement in the game when detecting the proximity between a ghost and a pacman. Currently, this code is not implemented into the game.
class LocationProximityModel {
    var currentLocation: [CLLocationDegrees]?
    
    var locationReference: [CLLocationDegrees]?
    
    func calculateProximity() -> String {
        let coordinate0 = CLLocation(latitude: self.currentLocation![0], longitude: self.currentLocation![1])
            
        
        let coordinate1 = CLLocation(latitude: self.locationReference![0], longitude: self.currentLocation![1])
        
        let distanceInMeters = coordinate0.distance(from: coordinate1)
        
        switch distanceInMeters {
        case 0..<5:
            return "Less than 5 meters"
        case 5..<10:
            return "Less than 10 meters"
        default:
            return "Far away"
        }
    }
}
