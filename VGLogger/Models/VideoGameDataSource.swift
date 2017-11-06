//
//  VideoGames.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/4/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class VideoGameDataSource: NSObject {
    
    var videogames: [AnyObject]
    
    init(dataSource: [AnyObject]) {
        videogames = dataSource
        super.init()
    }
    
    func numVideoGames() -> Int{
        return videogames.count
    }
    
    func videoGameAt(_ index: Int) -> VideoGame {
        let videogame = VideoGame( videogame: videogames[index] )
        return videogame
    }
    
}

