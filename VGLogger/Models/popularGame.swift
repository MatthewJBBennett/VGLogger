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
   // var json: JSON = JSON.null
    var rating: Float?
    //var name: String?
    
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
            
            Alamofire.request(urlRequest).responseJSON {response in print(response)
                if let allSections = response.result.value as? [[String : Any]]
                {
                    //Here we will loop through the array and parse each dictionary
                    for section in allSections
                    {
                        if let name = section["name"] as? String, let cover = section["cover"] as? [String : Any], let imageUrl = cover["url"] as? String
                            //let rating = section["total_rating"] as? Float
                        //guard let rating = section["total_rating"] as? String else{return}
                        {
                            //let rating = section["total_rating"] as? Float
                            //let outrating = Int(rating.rounded())   //Round the float rating up or down, then convert to int for output
//                            for i in 0..<imageUrl.count
//                            {
//                                if imageUrl[i].contains("https")
//                                {
//
//                                }
//                            }
                            print(name)
                        }
                    }
                }
            }
        }
    }
    
//    func getName() -> String
//    {
//        return name!
//    }
}
