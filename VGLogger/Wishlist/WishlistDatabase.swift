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
    //These expressions are the initializers for the database columns
    let id = Expression<Int>("id")
    let title = Expression<String>("title")
    let coverURL = Expression<String?>("cover")
     
    let path = NSSearchPathForDirectoriesInDomains(
        .documentDirectory, .userDomainMask, true
        ).first!
    
    var db:Connection
    
    override init(){
        self.db = try! Connection("\(path)/db.sqlite3")
        super.init()
        //Try to create the tables if they don't exist, ignore otherwise
        try? db.run(wishlist.create{ t in
            t.column(id, primaryKey: true)
            t.column(title)
            t.column(coverURL)
        })
    }
    
    //Database modification functions
    func insertIntoDatabase(gameID:Int, gameTitle:String, gameCover:String){
        let insert = wishlist.insert(id <- gameID, title <- gameTitle, coverURL <- gameCover)
        let _ = try? db.run(insert)
    }
    
    func removeFromDatabase(gameID:Int){
        let deleteStatement = try! db.prepare("DELETE FROM wishlist WHERE (id = (?))")
        try! deleteStatement.run(gameID)
        
    }
    
    //Getter functions for each column in the array
    func getTitleArray() -> [String]{
        var titleArray = [String]()
        for wishlistItem in try! db.prepare(wishlist){
            titleArray.append(wishlistItem[title])
        }
        return titleArray
    }
    
    func getIDArray() -> [Int]{
        var idArray = [Int]()
        for wishlistItem in try! db.prepare(wishlist){
            idArray.append(wishlistItem[id])
        }
        return idArray
    }
    
    func getCoverArray() -> [String]{
        var coverArray = [String]()
        for wishlistItem in try! db.prepare(wishlist){
            coverArray.append(wishlistItem[coverURL]!)
        }
        return coverArray
    }

    
}
