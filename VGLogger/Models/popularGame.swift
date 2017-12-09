//
//  popularGame.swift
//  VGLogger
//
//  Created by student on 12/3/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class popularGame: NSObject
{
    let apiKey = "2c4b6af8bd50607b85c8bc1813cb8fa5"
    var vgDS: VideoGameDataSource?
    var rating: Float?
    
    @objc dynamic var dataFromServer: [AnyObject]?
    
    //URL for popular game data
    //https://api-2445582011268.apicast.io/games/?fields=name,popularity,total_rating,cover&order=popularity:desc
    
    //URL for pulse news
    //https://api-2445582011268.apicast.io/pulses/?fields=title,published_at,author,image,url&order=published_at:desc
    
    //news
    func downloadData() {
        if let url = URL(string: "https://api-2445582011268.apicast.io/pulses/?fields=title,published_at,author,image,url&order=published_at:desc") {
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
                        if let author = section["author"] as? String, let image = section["image"] as? String, let title = section["title"] as? String, let url = section["url"] as? String
                        {
                            print(url)
                        }
                    }
                }
            }
        }
    }
}

