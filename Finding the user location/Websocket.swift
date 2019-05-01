//
//  Websocket.swift
//  Finding the user location
//
//  Created by keck on 4/24/19.
//  Copyright © 2019 Code Mask. All rights reserved.
//

import Foundation

import Starscream

/*
class Websocket: WebSocketDelegate{
    let socket = WebSocket(url: URL(string: "ws://172.17.2.225:8080/sockets")!)
    
    init() {
        
        socket.delegate = self
        socket.connect()
        socket.write(string: "Hi Server!") //example on how to write text over the socket!
    }
    
    
    
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
    
    
    
}
