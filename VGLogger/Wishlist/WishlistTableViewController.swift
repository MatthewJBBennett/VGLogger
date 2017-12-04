//
//  WishlistTableViewController.swift
//  VGLogger
//
//  Created by student on 11/27/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import SQLite
import Alamofire

class WishlistTableViewController: UITableViewController{
    
    @IBOutlet var wishlistView: UITableView!
    var wishlistDS: VideoGameDataSource?
    let apiKey = "2c4b6af8bd50607b85c8bc1813cb8fa5"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //wishlistView.register(UITableViewCell.self, forCellReuseIdentifier: "wishlistCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
   
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let gameIDs = WishlistObject.wishlistDB.getIDArray()
        return gameIDs.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WishlistCell", for: indexPath)
        let gameTitles = WishlistObject.wishlistDB.getTitleArray()
        let gameCovers = WishlistObject.wishlistDB.getCoverArray()
        let gameIDs = WishlistObject.wishlistDB.getIDArray()
        
        let theCell = cell as? WishlistTableViewCell
        
        let wishlistTitle = gameTitles[indexPath.row]
        let wishlistCover = gameCovers[indexPath.row]
        let wishlistID = gameIDs[indexPath.row]
        apiCall(videoGameID: wishlistID)
        theCell?.setWishlistCell(wishlistTitle, coverURL: wishlistCover)
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            let gameIDs = WishlistObject.wishlistDB.getIDArray()
            WishlistObject.wishlistDB.removeFromDatabase(gameID: gameIDs[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation
    
    func apiCall(videoGameID: Int ) {
        if let url = URL(string: "https://api-2445582011268.apicast.io/games/\(videoGameID)?fields=*"){
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            Alamofire.request(urlRequest).responseJSON { response in
                if let JSON = response.result.value as? [AnyObject]  {
                    self.wishlistDS = VideoGameDataSource(dataSource: JSON)
                    self.tableView.reloadData()
                }
            }
        }
    }


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier ==  "ShowVideoGameDetails"{
            let cell = sender as! WishlistTableViewCell
            if let indexPath = tableView.indexPath(for: cell), let ds = wishlistDS {
                let detailedVC = segue.destination as! VideoGameDetailedViewController
                detailedVC.videoGameForThisView(ds.videoGameAt(indexPath.row))
            }
        }
    }

}
