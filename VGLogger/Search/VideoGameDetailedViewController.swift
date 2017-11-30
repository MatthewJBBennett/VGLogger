//
//  VideoGameDetailedViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/4/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Hex

class VideoGameDetailedViewController: UIViewController {

    var videogame: VideoGame?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var coverImage: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var platformLabel: UILabel!
    @IBOutlet weak var esrbLabel: UILabel!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#C0C5CD")
        // Do any additional setup after loading the view.
        self.scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.frame.height+2000)//CGSize(width: self.view.frame.width, height: self.view.frame.height+2000)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let a = videogame {
            self.titleLabel.adjustsFontSizeToFitWidth = true
            self.summaryLabel.lineBreakMode = .byWordWrapping
            self.summaryLabel.numberOfLines = 0;
        
            self.titleLabel.text = a.videoGameName()
            self.summaryLabel.text = a.videoGameSummary()
            let rating = Int((a.videoGameTotalRating()?.rounded())!)
            self.ratingLabel.text = "Rating: \(rating) / 100"
        }
        if let aImage = videogame?.videoGameCoverImage()  {
            coverImage.contentMode = .scaleAspectFit
            coverImage.clipsToBounds = true
            
            coverImage.image = aImage
        }
        if let esrb = videogame?.videoGameEsrb() {
            esrbLabel.text = getEsrb(esrb: esrb)
        }
    }
    
    func getEsrb(esrb: Int) -> String {
        var esrbString = ""
        if esrb == 1 {
            esrbString = "RP"
        }
        else if esrb == 2 {
            esrbString = "EC"
        }
        else if esrb == 3 {
            esrbString = "E"
        }
        else if esrb == 4 {
            esrbString = "E10+"
        }
        else if esrb == 5 {
            esrbString = "T"
        }
        else if esrb == 6 {
            esrbString = "M"
        }
        else if esrb == 7 {
            esrbString = "AO"
        }
        return esrbString
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func videoGameForThisView(_ videogame: VideoGame) {
        self.videogame = videogame
    }

    @IBAction func didClickAddButton(_ sender: UIButton) {
        if let a = videogame{
            WishlistObject.wishlistDB.insertIntoDatabase(gameID: a.videoGameId()!, gameTitle: a.videoGameName()!, gameCover: a.videoGameUrl()!)
        }
        print(WishlistObject.wishlistDB.getTitleArray())
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
