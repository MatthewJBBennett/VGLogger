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
   // @IBOutlet weak var videoView: UIWebView!
    
    var urlToShare: String = ""
    
    override func viewDidLoad() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Share", style: .plain, target: self, action: #selector(addShare))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.white
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(hex: "#C0C5CD")
        // Do any additional setup after loading the view.
        self.scrollView.frame = self.view.bounds
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: self.view.frame.height+2000)//CGSize(width: self.view.frame.width, height: self.view.frame.height+2000)
    }
    
    @objc func addShare() {
        if let url = videogame?.videoGameUrl() {
            urlToShare = url
        }
        else {
            urlToShare = "Check out this game!"
        }
        let VC = UIActivityViewController(activityItems: [urlToShare], applicationActivities: nil)
        VC.popoverPresentationController?.sourceView = self.view
        self.present(VC, animated: true, completion: nil)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let summary = videogame?.videoGameSummary() {
            self.summaryLabel.lineBreakMode = .byWordWrapping
            self.summaryLabel.numberOfLines = 0;
            self.summaryLabel.text = summary
            self.summaryLabel.sizeToFit()
        }
        else {
            self.summaryLabel.text = "No summary is available yet :("
        }
        if let name = videogame?.videoGameName() {
            self.titleLabel.adjustsFontSizeToFitWidth = true
            self.titleLabel.text = name
        }
        else {
            self.titleLabel.text = "Unknown Game Title"
        }
        if let rate = videogame?.videoGameTotalRating() {
            let rating = Int((rate.rounded()))
            self.ratingLabel.text = "Rating: \(rating) / 100"
            //self.ratingLabel.sizeToFit()
        }
        else {
            self.ratingLabel.text = "Rating: N/A"
        }
        if let aImage = videogame?.videoGameCoverImage()  {
            coverImage.contentMode = .scaleAspectFit
            coverImage.clipsToBounds = true
            
            coverImage.image = aImage
        }
        else {
            coverImage.contentMode = .scaleAspectFit
            coverImage.clipsToBounds = true
            coverImage.image = #imageLiteral(resourceName: "no_image_available")
        }
        if let esrb = videogame?.videoGameEsrb() {
            esrbLabel.text = "Rated: " + getEsrb(esrb: esrb)
        }
        else {
            esrbLabel.text = "Rated: N/A"
        }
        if let platform = videogame?.videoGamePlatform() {
            platformLabel.text = getPlatform(platformArray: platform)
        }
        
        /*
        let videoID = "F0GROJ1F41E"
        let youtubeURL = URL(string: "https://www.youtube.com/embed/\(videoID)")
        videoView.loadRequest(URLRequest(url: youtubeURL!))
 */
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
    
    func getPlatform(platformArray: Array<Int>) -> String {
        var platform = " "
        //var first = false
        for i in platformArray {
            if i == 41 {
                platform += " Wii U,"
            }
            else if i == 37 {
                platform += " Nintendo 3DS,"
            }
            else if i == 48 {
                platform += " PS4,"
            }
            else if i == 49 {
                platform += " Xbox One,"
            }
            else if i == 130 {
                platform += " Nintendo Switch,"
            }
            else if i == 6 {
                platform += " PC,"
            }
            else if i == 9 {
                platform += " Playstation 3,"
            }
            else if i == 12 {
                platform += " Xbox 360,"
            }
            else if i == 5 {
                platform += " Wii,"
            }
            else if i == 46 {
                platform += " PS Vita,"
            }
            else if i == 20 {
                platform += " Nintendo DS,"
            }
            else if i == 4 {
                platform += " Nintendo 64,"
            }
                
            //else {
            //    return platform
            //}
        }
        platform.remove(at: platform.index(before: platform.endIndex))
        return platform
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
            WishlistObject.wishlistDB.insertIntoDatabase(gameID: a.videoGameId()!, gameTitle: a.videoGameName()!, gameCover: a.videoGameThumbnailURL()!)
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
