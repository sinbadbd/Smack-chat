
//
//  SocketServices.swift
//  Smack
//
//  Created by imran on 11/30/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import UIKit
import SocketIO
class SocketServices: NSObject {
    
    static let instance = SocketServices()
    
    override init() {
        super.init()
        print("\(socket)")
    }
    
    
    let socket: SocketIOClient = SocketIOClient(socketURL: URL(string: BASE_URL)!)
  
    
    func establishConnection(){
        socket.connect()
    }
    func closeConnection(){
        socket.disconnect()
    }
    func addChannel(channelName: String, channelDescription: String, completion: @escaping CompletionHandler){
        socket.emit("newChannel", channelName,channelDescription)
        completion(true)
    }
    
    func getChannel(completion: @escaping CompletionHandler){
        socket.on("channelCreated") { (dataArray, ack) in
            guard let channelName = dataArray[0] as? String else {return}
            guard let channelDesc = dataArray[1] as? String else {return}
            guard let channelId = dataArray[2] as? String else {return}
            
            let newChannel = Channel(channelTile: channelName, channelDescription: channelDesc, id: channelId)
            MesageService.instance.channels.append(newChannel)
            completion(true)
        }
    }
    
}
