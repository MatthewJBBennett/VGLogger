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
        self.title = "Home" //set page header at the very top
    }
    
    var downloadAssistant = popularGame()
    
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
            return 1    //1 table view cell that will hold the 9 collection view cells
        }
        else
        {
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
                                self.outputGameID.append(gameID)
                                self.outputGameURL.append(gameUrl)
                                self.outputGameName.append(name)
                                self.outputGameImage.append("https://images.igdb.com/igdb/image/upload/t_cover_small_2x/" + imageUrl + ".jpg")
                                
                                if let rating = section["total_rating"] as? Float
                                {
                                    let outrating = Int(rating.rounded())   //Round the float rating up or down, then convert to int for output
                                    
                                    self.outputRating.append("\(outrating)" + "%")
                                }
                                else
                                {
                                    self.outputRating.append("N/A")
                                }
                            }
                        }
                    }
                    group.leave()
                }
                group.notify(queue: .main) {
                    print("Finished all requests.")
                }
            }
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
                }
            }
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Specify that URLs are only opened if clicking on a newsTable cell
        if(tableView == newsTable)
        {
            let urlString = self.outputURL[indexPath.row]
            if let url = URL(string: urlString)
            {
                //Open URL within the browser
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
                
                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
        }
    }
    
    //all collectionView cell data below
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return 9    //number of horizontally scrollable collection view cells within the 1 table view cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "feedCollectionViewCell", for: indexPath) as! FeedCollectionViewCell
        
        let when = DispatchTime.now() + 2 //Make sure HTTP request has finished before this code runs
        DispatchQueue.main.asyncAfter(deadline: when)
        {
            cell.gameTitle?.adjustsFontSizeToFitWidth = true
            cell.gameTitle?.text = self.outputGameName[indexPath.row]
            cell.gameRating?.text = self.outputRating[indexPath.row]

            let outURL = URL(string: self.outputGameImage[indexPath.row])
            let data = try? Data(contentsOf: outURL!)
            if let imageData = data
            {
                cell.gameImage?.image = UIImage(data: data!)
            }
        }
        return cell
    }
    
   func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let urlString = self.outputGameURL[indexPath.row]
        
        //When clicked, open URL in safari within the app
        if let url = URL(string: urlString)
        {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
        }
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
