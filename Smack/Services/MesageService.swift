//
//  MesageService.swift
//  Smack
//
//  Created by imran on 11/28/17.
//  Copyright © 2017 Jonny B. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
class MesageService {
    
    static let instance  = MesageService()
    
    var channels = [Channel]()
    
    
    func findAllChannel(completion: @escaping CompletionHandler)  {
        Alamofire.request(URL_GET_CHANNELS, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: BEARE_HEADER).responseJSON { (response) in
            if response.result.error == nil {
                guard let data = response.data else {return}
                if let json = try! JSON(data: data).array {
                    for item in json {
                        let  name = item["name"].stringValue
                        let channelDescription = item["description"].stringValue
                        let id = item["_id"].stringValue
                        let channel = Channel(channelTile: name, channelDescription: channelDescription, id: id)
                        self.channels.append(channel)
                    }
                    completion(true)
                }
            } else {
                completion(false)
                debugPrint(response.result.error as Any)
            }
        }
    }
    
}
