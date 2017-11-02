//
//  Download.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/2/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Alamofire

class Download: NSObject {
    let apiKey = "2c4b6af8bd50607b85c8bc1813cb8fa5"
    
    func downloadData() {
        if let url = URL(string: "https://api-2445582011268.apicast.io/games/") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            
            urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            Alamofire.request(urlRequest)
                .responseJSON { response in
                    debugPrint(response)
                    print(response)
            }
            debugPrint(request)
        }
    }
}
