//
//  VideoGame.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/4/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class VideoGame: NSObject {
    
    var videogame: AnyObject
    
    /*
    init(videogame: AnyObject) {
        self.videogame = videogame
        super.init()
    }
 */
    init(videoGameData: Any) {
        
        //make constructor happy
        videogame = videoGameData as AnyObject
        
        //probably redundent but eh...
        if let dictionary = videoGameData as? Dictionary<String, AnyObject> {
            videogame = dictionary as! AnyObject
        }
        
        super.init()
    }
    
    
    func videoGameId() -> Int? {
        if let v = videogame["id"] {
            return v as? Int
        }
        return nil
    }
    
    func videoGameName() -> String? {
        if let v = videogame["name"] {
            return v as? String
        }
        return nil
    }
    
    func videoGameSlug() -> String? {
        if let v = videogame["slug"] {
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
    
    func videoGameSummary() -> String? {
        if let v = videogame["summary"] {
            return v as? String
        }
        return nil
    }
    
    // Number of follows a game gets before release
    func videoGameHypes() -> Int? {
        if let v = videogame["hypes"] {
            return v as? Int
        }
        return nil
    }
    
    // A number based on traffic to that game page
    func videoGamePopularity() -> Double? {
        if let v = videogame["popularity"] {
            return v as? Double
        }
        return nil
    }
    
    // Average user rating
    func videoGameRating() -> Double? {
        if let v = videogame["rating"] {
            return v as? Double
        }
        return nil
    }
    
    // Number of user ratings
    func videoGameRatingCount() -> Int? {
        if let v = videogame["rating_count"] {
            return v as? Int
        }
        return nil
    }
    
    // Rating based on external critic scores
    func videoGameAggregatedRating() -> Double? {
        if let v = videogame["aggregated_rating"] {
            return v as? Double
        }
        return nil
    }
    
    // Number of external critic scores
    func videoGameAggregatedRatingCount() -> Int? {
        if let v = videogame["aggregated_rating_count"] {
            return v as? Int
        }
        return nil
    }
    
    // Average rating based on both IGDB user and external critic scores
    func videoGameTotalRating() -> Double? {
        if let v = videogame["total_rating"] {
            return v as? Double
        }
        return nil
    }
    
    // Total number of user and external critic scores
    func videoGameTotalRatingCount() -> Int? {
        if let v = videogame["total_rating_count"] {
            return v as? Int
        }
        return nil
    }
    
    /*
    func videoGameImage() -> UIImage? {
        if let dict = videogame["cover"] {
            if let dictionary = dict as? Dictionary<String, AnyObject> {
                if let url = dictionary["url"] as? String {
                    let newUrl = "https:" + url
                    if let url = URL(string: newUrl),
                        let data = try? Data(contentsOf: url),
                        let image = UIImage(data: data) {
                        return image
                    }
            }
        }
        }
        return nil
    }
 */
    
    func videoGameCoverImage() -> UIImage? {
        if let dict = videogame["cover"] {
            if let dictionary = dict as? Dictionary<String, AnyObject> {
                let id = dictionary["cloudinary_id"] as? String
                let newUrl = "https://images.igdb.com/igdb/image/upload/t_cover_small_2x/" + id! + ".jpg"
                if let url = URL(string: newUrl),
                    let data = try? Data(contentsOf: url),
                    let image = UIImage(data: data) {
                    return image
                }
            }
        }
        return nil
    }
    
    /*
    func videoGameCoverImageID() -> String? {
        if let dict = videogame["cover"] {
            if let dictionary = dict as? Dictionary<String, AnyObject> {
                return dictionary["cloudinary_id"] as? String
            }
        }
        return nil
    }
    */
    
    /*
    func videoGameImage() -> String? {
        if let dict = videogame["cover"] {
            if let dictionary = dict as? Dictionary<String, AnyObject> {
                return dictionary["url"] as? String
            }
        }
        return nil
    }
 */
}


