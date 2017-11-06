//
//  VideoGame.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/4/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class VideoGame: NSObject {
    
    let videogame: AnyObject
    
    init(videogame: AnyObject) {
        self.videogame = videogame
        super.init()
    }
    
    func videoGameName() -> String? {
        if let v = videogame["name"] {
            return v as? String
        }
        return nil
    }
    
    func videoGameUrl() -> String? {
        if let v = videogame["url"] {
            return v as? String
        }
        return nil
    }
}
