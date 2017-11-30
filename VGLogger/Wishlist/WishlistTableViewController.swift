//
//  WishlistTableViewController.swift
//  VGLogger
//
//  Created by student on 11/27/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import SQLite

class WishlistTableViewController: UITableViewController{
    @IBOutlet var wishlistView: UITableView!
    @IBOutlet weak var coverImageThumbnail: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //wishlistView.register(UITableViewCell.self, forCellReuseIdentifier: "wishlistCell")
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
        cell.textLabel?.text = gameTitles[indexPath.row]
        let gameCovers = WishlistObject.wishlistDB.getCoverArray()
        let newUrl = "https://images.igdb.com/igdb/image/upload/t_thumb/" + gameCovers[indexPath.row] + ".jpg"
        if let url = URL(string: newUrl),
            let data = try? Data(contentsOf: url),
            let image = UIImage(data: data) {
                coverImageThumbnail.image = image
            }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
