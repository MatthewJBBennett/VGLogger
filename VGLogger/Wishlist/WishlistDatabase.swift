//
//  WishlistDatabase.swift
//  VGLogger
//
//  Created by student on 11/27/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import SQLite



class WishlistDatabase: NSObject {
    
    let wishlist = Table("wishlist")
    let id = Expression<Int64>("id")
    let title = Expression<String>("title")
    
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    
    let db:Connection
    
    override init(){
        self.db = try! Connection("\(path)/db.sqlite3")
        super.init()
        try! db.run(wishlist.create{ t in
            t.column(id, primaryKey: true)
            t.column(title)
        })
    }
    
    func insertIntoDatabase(gameID:Int64, gameTitle:String) -> Int64{
        let insert = wishlist.insert(id <- gameID, title <- gameTitle)
        let rowid = try! db.run(insert)
        return rowid
    }
    
    func getValueFromDatabase() -> Expression<String>{
        return wishlist[title]
    }
    
}
