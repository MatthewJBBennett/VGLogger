//
//  SearchTableViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/4/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Alamofire

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    let searchBar = UISearchBar()
    let tableData = ["Halo", "Call of Duty", "Battlefield 1", "Super Mario", "Minesweeper", "Tetris", "GTA V", "Doom", "Super Smash Bros"]
    let apiKey = "2c4b6af8bd50607b85c8bc1813cb8fa5"
    var videogamesDS: VideoGameDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchBar()
        //apiCall()
    }

    func createSearchBar() {
        searchBar.showsCancelButton = false
        searchBar.placeholder = "Search for games here"
        searchBar.delegate = self
        
        self.navigationItem.titleView = searchBar
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
       
        if let ads = videogamesDS {
            return ads.numVideoGames()
        }
        return 0
 
        //return tableData.count
    }

    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Used so the keyboard goes away when scrolling
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Used so the keyboard goes away when search button is pressed
        searchBar.endEditing(true)
        //print(searchBar.text)
        if let searchQuery = searchBar.text {
            apiCall(params: searchQuery)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameCell", for: indexPath)
        // Configure the cell...
        
        
        if let theCell = cell as? VideoGameTableViewCell, let artist = videogamesDS?.videoGameAt(indexPath.row) {
            theCell.useVideoGame(artist)
        }

        return cell
    }
    
    func apiCall(params: String) {
        let UrlString :String = params.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        // Limit is set at 10, change later when more results are needed
        if let url = URL(string: "https://api-2445582011268.apicast.io/games/?search=" + "\(UrlString)" + "&limit=10&fields=*") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            

            Alamofire.request(urlRequest).responseJSON { response in
                if let JSON = response.result.value as? [AnyObject]  {
                    self.videogamesDS = VideoGameDataSource(dataSource: JSON)
                    self.tableView.reloadData()
                }
                //debugPrint(response)
                print(response)
            }
            
            //debugPrint(request)
        }
    }
      
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "ShowVideoGameDetails" {
            let cell = sender as! VideoGameTableViewCell
            if let indexPath = tableView.indexPath(for: cell), let ds = videogamesDS {
                let detailedVC = segue.destination as! VideoGameDetailedViewController
                detailedVC.videoGameForThisView(ds.videoGameAt(indexPath.row))
            }
            
        }
 
    }
}
