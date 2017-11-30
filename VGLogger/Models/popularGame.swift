//
//  popularGame.swift
//  VGLogger
//
//  Created by student on 11/29/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class popularGame: NSObject
{
    let apiKey = "2c4b6af8bd50607b85c8bc1813cb8fa5"
    var vgDS: VideoGameDataSource?
    var json: JSON = JSON.null
    
    
    @objc dynamic var dataFromServer: [AnyObject]?
    
    //URL for popular game data
    //https://api-2445582011268.apicast.io/games/?fields=name,popularity,total_rating,cover&order=popularity:desc
    
    //URL for pulse news
    //https://api-2445582011268.apicast.io/pulses/?fields=title,published_at,author,image,url&order=published_at:desc
    func downloadData() {
        if let url = URL(string: "https://api-2445582011268.apicast.io/games/?fields=name,popularity,total_rating,cover&order=popularity:desc") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            Alamofire.request(urlRequest).responseJSON { response in
                if let responseJSON = response.result.value {
                    //let videogames = VideoGameDataSource(dataSource: JSON as! [AnyObject])
                    //self.vgDS = VideoGameDataSource(dataSource: self.dataFromServer!)
                    //self.json = JSON(responseJSON)
                    //let a = self.json["cover"][0]["url"].arrayValue
                    //let a = self.json[0]["name"].arrayValue
                    //print("here: \(a[0])")
                    //print(self.json)
//                    if let jArray = json.array
//                    {
//                        if let covers = jArray[0]["cover"].array
//                        {
//                            for test in covers
//                            {
//                                if let url = test["url"].string
//                                {
//                                    print(url)
//                                }
//                            }
//                        }
//                    }
                    
                    var json: [Any]?
                    do {
                        json = try JSONSerialization.jsonObject(with: data)
                    } catch {
                        print(error)
                    }
                    guard let item = json?.first as? [String: Any],
                        let person = item["person"] as? [String: Any],
                        let age = person["age"] as? Int else {
                            return
                    }
                    
                    self.json = JSON(["name"])
                    if let name = self.json["name"].string
                    {
                        print(name)
                    }
                    
                    
                }
                else
                {
                    print("JSON error")
                }
                
                //debugPrint(response)
                //print(response)
            }
            //debugPrint(request)
        }
    }
}
