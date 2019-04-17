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
