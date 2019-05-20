//
//  ViewController.swift
//  Finding the user location
//
//  Created by Mahmudur Rahman on 9/9/17.
//  Copyright © 2017 Code Mask. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit
import GoogleSignIn
import Starscream



class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, GIDSignInUIDelegate, WebSocketDelegate {
    var locationmanger = CLLocationManager()
    let locationProximityModel = LocationProximityModel()
    @IBOutlet weak var map: MKMapView!
    
    var socket: WebSocket!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationmanger.delegate = self
        locationmanger.desiredAccuracy = kCLLocationAccuracyBest
        locationmanger.requestWhenInUseAuthorization()
        locationmanger.startUpdatingLocation()
   
        GIDSignIn.sharedInstance().uiDelegate = self
        
        var request = URLRequest(url: URL(string: "172.17.2.225:8080/sockets")!)
        request.timeoutInterval = 5
        socket = WebSocket(request: request)
        socket.delegate = self
        socket.connect()
        // Uncomment to automatically sign in the user.
        //GIDSignIn.sharedInstance().signInSilently()
        
        // TODO(developer) Configure the sign-in button look/feel
        // ...
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    
    @IBAction func goButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "starGame", sender: self)
        //Need code to tell server that a person is joining. Require data from server(gamestatus, player number etc.
    }
    
    // Prepares for the Segue that the Go button initiates. Sends the information received from server forward.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startGame" {
            let playerVC = segue.destination as! PlayerViewController
            /*
                Set up the variables in PlayerViewController in order for people to see.
 
 
 
 */
        }
    }
    
    
    //Proximity

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userlocation: CLLocation = locations[0]
        let latitude = userlocation.coordinate.latitude
        let longitude = userlocation.coordinate.longitude
        locationProximityModel.currentLocation = [latitude, longitude]
        
        let delta = 0.05
        
        let span = MKCoordinateSpan(latitudeDelta: delta, longitudeDelta: delta)
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        self.map.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.title = "My Location"
        annotation.coordinate = location
        map.addAnnotation(annotation)
        
    }
    
    
    
    func checkProximity() -> String{
        //locationReference(latitude: referenceLocation[0], longitude: referenceLocation[1])
        if locationProximityModel.currentLocation != nil && locationProximityModel.locationReference != nil {
            let closeness = locationProximityModel.calculateProximity()
            return (closeness)
        } else {
            return "Doesn't have data"
        }
    }
    
    func locationReference(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        
        locationProximityModel.locationReference = [latitude, longitude]
    }
    
    @IBAction func getProximity(_ sender: UIButton) {
        locationReference(latitude: CLLocationDegrees(34.0770168), longitude: CLLocationDegrees(-118.4740101))
        print(checkProximity())
        
    }
    
    //Google Signin
    
    private func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        //UIActivityIndicatorView.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    private func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.present(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    private func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SignIn(_ sender: UIButton) {
  performSegue(withIdentifier:"pressedGIDButton", sender:self )
    
    }
    
    
    //WebSocket Protocol
    func websocketDidConnect(socket: WebSocketClient) {
        print("websocket is connected")
    }
    
    func websocketDidDisconnect(socket: WebSocketClient, error: Error?) {
        print("websocket is disconnected: \(error?.localizedDescription)")
    }
    
    func websocketDidReceiveMessage(socket: WebSocketClient, text: String) {
        print("got some text: \(text)")
    }
    
    func websocketDidReceiveData(socket: WebSocketClient, data: Data) {
        print("got some data: \(data.count)")
    }
    
    //After receiving message, save data into Game/Player/... model. Then we don't have to call the server from other view controllers.
}

