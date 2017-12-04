//
//  FeedViewController.swift
//  VGLogger
//
//  Created by student on 12/3/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SafariServices

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDelegate, UICollectionViewDataSource
{
    var vg: VideoGame?
    var videogamesDS: VideoGameDataSource?
    //var pg: popularGame?
    var pg = popularGame()
    var selectedIndexPath: NSIndexPath?
    let apiKey = "8ea2aa61804af17b2028af0a36637232"
    //Popular Game
    var outputGameName = [String]()
    var outputRating = [String]()
    var outputGameImage = [String]()
    var outputGameID = [Int]()
    var outputGameURL = [String]()
    
    //News
    var outputAuthor = [String]()
    var outputArticle = [String]()
    var outputURL = [String]()
    var outputArticleImage = [String]()
    
    @IBOutlet weak var newsTable: UITableView!
    @IBOutlet weak var popularGameTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //downloadAssistant.downloadData()
        self.title = "Home"
    }
    
    var downloadAssistant = popularGame()
    
    var categories = ["Action", "RPG", "Indie", "Kids", "adf", "asfuh", "ertuh", "povns", "388bj", "nz712"]
    var articles = ["Leak Reveals Character Customization in 'Star Wars Battlefront II'", "Who is the King of Fear? Geese shows off his moves U2014 and two new costumes U2014 in his Tekken 7 launch trailer", "In-Game Purchases Poison The Well", "A new Fortnite update adds weapons, smoke grenades, and two more leaderboards"]
    var authors = ["By Blake Hester", "Zavian \"mushin_Z\" Sildra", "Kirk Hamilton", "Andy Chalk"]
    
    
    //Set table view headers
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        if (tableView == popularGameTable)
        {
            return "POPULAR GAMES RIGHT NOW"
        }
        else
        {
            return "PULSE: RECENT GAMING NEWS"
        }
    }
    
    //Set rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (tableView == popularGameTable)
        {
            //return categories.count
            return 1
        }
        else
        {
            //return articles.count
            return 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == popularGameTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier : "popularGameCell", for : indexPath) as! PopularGameTableViewCell
            cell.collectionview?.delegate = self
            cell.collectionview?.dataSource = self
            cell.collectionview?.reloadData()
            
            let group = DispatchGroup()
            
            if let url = URL(string: "https://api-2445582011268.apicast.io/games/?fields=id,url,name,popularity,total_rating,cover&order=popularity:desc") {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = HTTPMethod.get.rawValue
                urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                
                group.enter()
                Alamofire.request(urlRequest).responseJSON {response in
                    if let allSections = response.result.value as? [[String : Any]]
                    {
                        //Here we will loop through the array and parse each dictionary
                        for section in allSections
                        {
                            if let gameID = section["id"] as? Int, let gameUrl = section["url"] as? String, let name = section["name"] as? String, let cover = section["cover"] as? [String : Any], let imageUrl = cover["cloudinary_id"] as? String
                            {
                                //                            for i in 0..<imageUrl.count
                                //                            {
                                //                                if imageUrl[i].contains("https")
                                //                                {
                                //
                                //                                }
                                //                            }
//                                if let dictionary = cover as? Dictionary<String, AnyObject>
//                                {
//                                    let id = dictionary["cloudinary_id"] as? String
//                                    let newUrl = "https://images.igdb.com/igdb/image/upload/t_cover_small_2x/" + id! + ".jpg"
//                                    if let url = URL(string: newUrl),
//                                        let data = try? Data(contentsOf: url),
//                                        let image = UIImage(data: data)
//                                    {
//                                        print(id)
//                                    }
//                                }
                                self.outputGameID.append(gameID)
                                self.outputGameURL.append(gameUrl)
                                //print(self.outputGameURL)
                                self.outputGameName.append(name)
                                //self.outputGameImage.append(imageUrl)
                                self.outputGameImage.append("https://images.igdb.com/igdb/image/upload/t_cover_small_2x/" + imageUrl + ".jpg")
                               // self.outputRating.append("N/A")
                                //print(self.outputGameName)
                                //cell.gameTitleLabel?.text = outputGameName[indexPath.row]
                                if let rating = section["total_rating"] as? Float
                                {
                                    let outrating = Int(rating.rounded())   //Round the float rating up or down, then convert to int for output
                                    
                                    //self.outputGameName.append(name)
                                    self.outputRating.append("\(outrating)" + "%")
                                    //print(self.outputRating)
                                }
                                else
                                {
                                    self.outputRating.append("N/A")
                                }
                            }
//                            else{
//                                self.outputRating.append("N/A")
//                            }
//                            if let rating = section["total_rating"] as? Float
//                            {
//                                let outrating = Int(rating.rounded())   //Round the float rating up or down, then convert to int for output
//
//                                //self.outputGameName.append(name)
//                                self.outputRating.append("\(outrating)")
//                            }
                        }
                    }
                    group.leave()
                }
                group.notify(queue: .main) {
                    print("Finished all requests.")
                }
                //group.leave()
            }
            // var temp = pg.getName()
            //cell.gameTitleLabel?.text = self.outputGameName[indexPath.row]
            //cell.gameTitleLabel?.text = categories[indexPath.row]
            //cell.gameTitleLabel?.text = pg?.name[indexPath.row]
            //cell.gameTitleLabel?.text = temp[indexPath.row]
            return cell
        }
        //News table
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier : "newsCell", for : indexPath) as! NewsTableViewCell
            
            cell.contentView.layer.borderColor = UIColor.blue.cgColor
            cell.contentView.layer.borderWidth = 1.0
            
            if let url = URL(string: "https://api-2445582011268.apicast.io/pulses/?fields=title,published_at,author,image,url&order=published_at:desc") {
                var urlRequest = URLRequest(url: url)
                urlRequest.httpMethod = HTTPMethod.get.rawValue
                urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
                urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
                
                Alamofire.request(urlRequest).responseJSON {response in
                    if let allSections = response.result.value as? [[String : Any]]
                    {
                        for section in allSections
                        {
                            if let author = section["author"] as? String, let image = section["image"] as? String, let title = section["title"] as? String, let url = section["url"] as? String
                            {
                                self.outputAuthor.append(author)
                                self.outputArticle.append(title)
                                self.outputURL.append(url)
                                self.outputArticleImage.append(image)
                                //self.outputURL = URL(string: image)
//                                let outURL = URL(string: image)
//                                let data = try? Data(contentsOf: outURL!)
//                                if let imageData = data
//                                {
//                                    cell.articleImage?.image = UIImage(data: data!)
//                                }
                            }
                        }
                    }
                    let outURL = URL(string: self.outputArticleImage[indexPath.row])
                    let data = try? Data(contentsOf: outURL!)
                    if let imageData = data
                    {
                        cell.articleImage?.image = UIImage(data: data!)
                    }
                    cell.authorLabel?.text = self.outputAuthor[indexPath.row]
                    cell.articleTitleLabel?.text = self.outputArticle[indexPath.row]
                    // cell.articleImage?.image = UIImage(named: self.outputArticleImage[indexPath.row])
                }
            }
            //cell.articleTitleLabel?.text = articles[indexPath.row]
            //cell.authorLabel?.text = authors[indexPath.row]
            //cell.articleImage?.image = UIImage(named: "https://assets.vg247.com/current//2017/09/destiny_2_emb_strike_the_pyramidion_3.jpg")
            //cell.layer.borderColor = UIColor.red.cgColor
            return cell
        }
    }
    
    //URLs to be opened
    let urlArray = ["http://www.rollingstone.com/glixel/news/character-customization-may-come-to-battlefront-ii-w512893", "http://shoryuken.com/2017/11/29/who-is-the-king-of-fear-geese-shows-off-his-moves-and-two-new-costumes-in-his-tekken-7-launch-trailer/", "https://kotaku.com/in-game-purchases-poison-the-well-1820844066", "http://www.pcgamer.com/a-new-fortnite-update-adds-weapons-smoke-grenades-and-two-more-leaderboards"]
    
    //Open URL
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Specify that URLs are only opened if clicking on a newsTable cell
        if(tableView == newsTable)
        {
            let urlString = self.outputURL[indexPath.row]
            if let url = URL(string: urlString)
            {
              //  UIApplication.shared.open(url, options: [:], completionHandler: nil)
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                
                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
        }
    }
    
    //collectionView cell data
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCollectionViewCell", for: indexPath) as! FeedCollectionViewCell
        
        let when = DispatchTime.now() + 2 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            cell.gameTitle?.adjustsFontSizeToFitWidth = true
            cell.gameTitle?.text = self.outputGameName[indexPath.row]
            cell.gameRating?.text = self.outputRating[indexPath.row]
//            if let aimage = self.vg?.videoGameCoverImage()
//            {
//                cell.gameImage?.image = aimage
//            }
            let outURL = URL(string: self.outputGameImage[indexPath.row])
            let data = try? Data(contentsOf: outURL!)
            if let imageData = data
            {
                cell.gameImage?.image = UIImage(data: data!)
            }
            //cell.gameImage?.image = UIImage(named: vg?.videoGameCoverImage())
        }
        
        //cell.gameRating?.text = self.outputRating[indexPath.row]
        //cell.gameTitle?.text = self.outputGameName[indexPath.row]
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let urlString = self.outputGameURL[indexPath.row]
        
        if let url = URL(string: urlString)
        {
            //  UIApplication.shared.open(url, options: [:], completionHandler: nil)
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }

//        if let url = URL(string: "https://api-2445582011268.apicast.io/games/" + "\(outputGameID[indexPath.row])" + "?fields=*")
//        {
//            var urlRequest = URLRequest(url: url)
//            urlRequest.httpMethod = HTTPMethod.get.rawValue
//            urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
//            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
//
//            Alamofire.request(urlRequest).responseJSON { response in
//                if let JSON = response.result.value as? [AnyObject]  {
//                    self.videogamesDS = VideoGameDataSource(dataSource: JSON)
//                }
//                //debugPrint(response)
//                print(response)
//            }
//        }
//        //print([indexPath.row])
//        print(outputGameID[indexPath.row])
//        let cell = collectionView.cellForItem(at: indexPath)
//        //selectedIndexPath = indexPath.row
//        performSegue(withIdentifier: "VGDVSegue", sender: cell)

    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
//    {
//        //Segue to video game detailed view
//        if segue.identifier == "VGDVSegue"
//        {
//            //let cell = sender as! FeedCollectionViewCell
//
//            //self.collectionview.registerClass(FeedCollectionViewCell.self, forCellWithReuseIdentifier: "VGDVSegue")
//            if let indexPath = collectionView.indexPath(for: sender as! FeedCollectionViewCell), let ds = videogamesDS
//            {
//                let detailedVC = segue.destination as! VideoGameDetailedViewController
//                detailedVC.videoGameForThisView(ds.videoGameAt(indexPath.row))
//
//                let backItem = UIBarButtonItem()
//                backItem.title = "Back"
//                backItem.tintColor = UIColor(hex: "#ffffff")
//                navigationItem.backBarButtonItem = backItem
//            }
//        }
//    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

