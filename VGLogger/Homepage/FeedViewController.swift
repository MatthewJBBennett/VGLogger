//
//  FeedViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/2/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Alamofire

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    var vg: VideoGame?
    //var pg: popularGame?
    var pg = popularGame()
    
    @IBOutlet weak var newsTable: UITableView!
    @IBOutlet weak var popularGameTable: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        downloadAssistant.downloadData()
        self.title = "Home"
        
    }
    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    var downloadAssistant = popularGame()
    
    var categories = ["Action", "RPG", "Indie", "Kids"]
    var articles = ["Leak Reveals Character Customization in 'Star Wars Battlefront II'", "Who is the King of Fear? Geese shows off his moves U2014 and two new costumes U2014 in his Tekken 7 launch trailer", "In-Game Purchases Poison The Well", "A new Fortnite update adds weapons, smoke grenades, and two more leaderboards"]
    var authors = ["By Blake Hester", "Zavian \"mushin_Z\" Sildra", "Kirk Hamilton", "Andy Chalk"]
    
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
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat
//    {
//        if (tableView == newsTable)
//        {
//            return 31.0
//        }
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if (tableView == popularGameTable)
        {
            //return categories.count
            return 1
        }
        else
        {
            return articles.count
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(tableView == popularGameTable)
        {
           // var temp = pg.getName()
            let cell = tableView.dequeueReusableCell(withIdentifier : "popularGameCell", for : indexPath) as! PopularGameTableViewCell
            cell.gameTitleLabel?.text = categories[indexPath.row]
            //cell.gameTitleLabel?.text = pg?.name[indexPath.row]
            //cell.gameTitleLabel?.text = temp[indexPath.row]
            
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier : "newsCell", for : indexPath) as! NewsTableViewCell
            cell.articleTitleLabel?.text = articles[indexPath.row]
            cell.authorLabel?.text = authors[indexPath.row]
            cell.articleImage?.image = UIImage(named: "https://assets.vg247.com/current//2017/09/destiny_2_emb_strike_the_pyramidion_3.jpg")
            return cell
        }
    }
    
    //URLs to be opened
    let urlArray = ["http://www.rollingstone.com/glixel/news/character-customization-may-come-to-battlefront-ii-w512893", "http://shoryuken.com/2017/11/29/who-is-the-king-of-fear-geese-shows-off-his-moves-and-two-new-costumes-in-his-tekken-7-launch-trailer/", "https://kotaku.com/in-game-purchases-poison-the-well-1820844066", "http://www.pcgamer.com/a-new-fortnite-update-adds-weapons-smoke-grenades-and-two-more-leaderboards"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        //Specify that URLs are only opened if clicking on a newsTable cell
        if(tableView == newsTable)
        {
            let urlString = self.urlArray[indexPath.row]
            if let url = URL(string: urlString)
            {
                 UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    }
}
