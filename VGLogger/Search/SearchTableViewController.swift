//
//  SearchTableViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/4/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Hex
import Alamofire

class SearchTableViewController: UITableViewController, UISearchBarDelegate {
    let searchBar = UISearchBar()
    let apiKey = "8ea2aa61804af17b2028af0a36637232"
    //let apiKey = "2c4b6af8bd50607b85c8bc1813cb8fa5"
    var videogamesDS: VideoGameDataSource?
    
    let defaults = UserDefaults.standard
    let valueIds: [Int] = [48, 49, 130, 41, 6, 9, 12, 5, 37, 46, 13, 14, 15, 31, 4, 5, 9, 10, 12, 1, 3, 4, 5, 6]
    var cell: FilterSideBarTableViewCell?
    
    let options: [String] = ["Platform", "Genre", "ESRB"]
    let platformOptions: [String] = ["PS4", "Xbox One", "Nintendo Switch", "Wii U", "PC", "Playstation 3", "Xbox 360", "Wii", "Nintendo 3DS", "PS Vita"]
    let genresOptions: [String] = ["Simulator", "Sport", "Strategy", "Adventure", "Fighting", "Shooter", "Puzzle", "Racing", "RPG"]
    let esrbOptions: [String] = ["RP", "E", "E10+", "T", "M"]
    
    var platformParameter: String = ""
    var genresParameter: String = ""
    var esrbParameter: String = ""
    var ratingParameter: String = ""
    var counter: Int = 0
    var didSearch = false
    
    var optionsList: [Bool] = []
    var catagory1List: [Bool] = []
    var catagory2List: [Bool] = []
    var catagory3List: [Bool] = []
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
   
    func getOptionsList(data: [Bool]) {
        optionsList = data
    }
    
    func startIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.white
        activityIndicator.color = UIColor(hex: "#0A6ACD")
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopIndicator() {
        activityIndicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(hex: "#C0C5CD") // gray
        createSearchBar()
        
        /*
        if defaults.value(forKey: "switchON") != nil {
            let List = defaults.value(forKey: "switchON") as! [Bool]
            //print("Here " + "\(optionsList)")
            for i in List {
                if i == true {
                    cell?.sideBarSwitch.setOn(true, animated: false)
                }
            }
        }
        */
        //let defaults = UserDefaults.standard
        //defaults.removeObject(forKey: "switchON")
        
        if defaults.array(forKey: "switchON") != nil {
            optionsList = defaults.array(forKey: "switchON")  as? [Bool] ?? [Bool]()
        }
        else {
            for _ in 0...23 {
                optionsList.append(false)
            }
        }
        
        
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
            if ads.numVideoGames() == 0 {
                let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
                noDataLabel.text          = "No search results found"
                noDataLabel.textColor     = UIColor.black
                noDataLabel.textAlignment = .center
                tableView.backgroundView  = noDataLabel
                tableView.separatorStyle  = .none
            }
            return ads.numVideoGames()
        }
        else {
                return 0
        }
        //return 0
 
        //return tableData.count
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        /*
        if defaults.value(forKey: "switchON") != nil {
            optionsList = defaults.value(forKey: "switchON") as! [Bool]
            print("Here " + "\(optionsList)")
        }
 */
 /*
        if defaults.value(forKey: "slidON") != nil {
            let rating = defaults.value(forKey: "slidON") as! Int
            ratingParameter = "&filter[rating][gte]=" + "\(rating)"
            print("Here " + "\(ratingParameter)")
        }
        */
      /*
        counter = 0
        for _ in platformOptions {
            catagory1List.append(optionsList[counter])
            counter += 1
        }
        for _ in genresOptions {
            catagory2List.append(optionsList[counter])
            counter += 1
        }
        for _ in esrbOptions {
            catagory3List.append(optionsList[counter])
            counter += 1
        }
 */
        // 10p, 9g, 5e
        /*
        var tempCounter = 0;
        while tempCounter < 10 {
            catagory1List.append(optionsList[tempCounter]);
            tempCounter += 1;
        }
        while tempCounter < 19 {
            catagory2List.append(optionsList[tempCounter]);
            tempCounter += 1;
        }
        while  tempCounter < 24 {
            catagory3List.append(optionsList[tempCounter]);
            tempCounter += 1;
        }
        */
        
    }

    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        // Used so the keyboard goes away when scrolling
        searchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Used so the keyboard goes away when search button is pressed
        searchBar.endEditing(true)
        //print(searchBar.text)
        didSearch = true
        if let searchQuery = searchBar.text {
            makeURLOptions()
            apiCall(params: searchQuery)
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoGameCell", for: indexPath)
        // Configure the cell...
        
        
        if let theCell = cell as? VideoGameTableViewCell, let artist = videogamesDS?.videoGameAt(indexPath.row) {
            theCell.useVideoGame(artist)
        }
        cell.backgroundColor = UIColor(hex: "#C0C5CD")
        return cell
    }
    
    //filter[rating][gte]=80
    //filter[platforms][eq]=48
    //filter[genres][eq]=14
    //filter[esrb][eq]=3
    
    func apiCall(params: String) {
        let UrlString :String = params.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        // Limit is set at 10, change later when more results are needed
        
        
        if let url = URL(string: "https://api-2445582011268.apicast.io/games/?search=" + "\(UrlString)" + ratingParameter + platformParameter + genresParameter + esrbParameter + "&limit=50&fields=*") {//" ){//+ "\(platformParameter)") {
            
            self.startIndicator()
            print(url)
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.addValue(apiKey, forHTTPHeaderField: "user-key")
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            
            resetParameters()
            
            Alamofire.request(urlRequest).responseJSON { response in
                if let JSON = response.result.value as? [AnyObject]  {
                    self.videogamesDS = VideoGameDataSource(dataSource: JSON)
                    self.tableView.reloadData()
                    self.stopIndicator()
                }
                //debugPrint(response)
                print(response)
            }
            
            //debugPrint(request)
        }
    }
    
    func makeURLOptions() {
        if defaults.value(forKey: "slidON") != nil {
            let rating = defaults.value(forKey: "slidON") as! Int
            if rating != 0 {
                ratingParameter = "&filter[rating][gte]=" + "\(rating)"
            }
            print("Here " + "\(ratingParameter)")
        }
        
        
        if defaults.value(forKey: "switchON") != nil {
            optionsList = defaults.value(forKey: "switchON") as! [Bool]
            print("Here " + "\(optionsList)")
        }
        
        var tempCounter = 0
        while tempCounter < 10 {
            catagory1List.append(optionsList[tempCounter])
            tempCounter += 1
        }
        while tempCounter < 19 {
            catagory2List.append(optionsList[tempCounter])
            tempCounter += 1
        }
        while  tempCounter < 24 {
            catagory3List.append(optionsList[tempCounter])
            tempCounter += 1
        }
        
        //print("OptionsList in SC: \(optionsList)")
        
        //iterate through each list of options, appending appropriate strings
        //to the url as needed
        var counter = 0
        var first = false
        var trueItems = 0
        var tempParam = ""
        for i in catagory1List {
            if i == true {
                trueItems += 1
                if trueItems > 1 {
                    if first == false {
                        platformParameter = "&filter[platforms][any]=" + String(valueIds[counter]) + "," + tempParam + ","
                        first = true
                    }
                    else {
                        platformParameter += String(valueIds[counter]) + ","
                    }
                }
                if trueItems <= 1 {
                    platformParameter = "&filter[platforms][eq]=" + String(valueIds[counter])
                    tempParam = String(valueIds[counter])
                }
            }
            counter += 1
        }
        if first == true {
            platformParameter.remove(at: platformParameter.index(before: platformParameter.endIndex))
        }
        print("Platforms: \(platformParameter)")
        
        counter = 0
        first = false
        trueItems = 0
        tempParam = ""
        for i in catagory2List {
            if i == true {
                trueItems += 1
                if trueItems > 1 {
                    if first == false {
                        genresParameter = "&filter[genres][any]=" + String(valueIds[counter + platformOptions.count]) + "," + tempParam + ","
                        first = true
                    }
                    else {
                        genresParameter += String(valueIds[counter]) + ","
                    }
                }
                if trueItems <= 1 {
                    genresParameter = "&filter[genres][eq]=" + String(valueIds[counter + platformOptions.count])
                    tempParam = String(valueIds[counter + platformOptions.count])
                }
            }
            counter += 1
        }
        if first == true {
            genresParameter.remove(at: genresParameter.index(before: genresParameter.endIndex))
        }
        print("Genres: \(genresParameter)")
        
        counter = 0
        first = false
        trueItems = 0
        tempParam = ""
        for i in catagory3List {
            if i == true {
                trueItems += 1
                if trueItems > 1 {
                    if first == false {
                        esrbParameter = "&filter[esrb.rating][any]=" + String(valueIds[counter + platformOptions.count + genresOptions.count]) + "," + tempParam + ","
                        first = true
                    }
                    else {
                        esrbParameter += String(valueIds[counter]) + ","
                    }
                }
                if trueItems <= 1 {
                    esrbParameter = "&filter[esrb.rating][eq]=" + String(valueIds[counter + platformOptions.count + genresOptions.count])
                    tempParam = String(valueIds[counter + platformOptions.count + genresOptions.count])
                }
            }
            counter += 1
        }
        if first == true {
            esrbParameter.remove(at: esrbParameter.index(before: esrbParameter.endIndex))
        }
        print("ESRB: \(esrbParameter)")
    }
    
    func resetParameters() {
        platformParameter = ""
        genresParameter = ""
        esrbParameter = ""
        ratingParameter = ""
        catagory1List = []
        catagory2List = []
        catagory3List = []
        //optionsList = []
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
        if segue.identifier == "filterSegue" {
            resetParameters()
            searchBar.endEditing(true)
        }
        if segue.identifier == "ShowVideoGameDetails" {
            let cell = sender as! VideoGameTableViewCell
            if let indexPath = tableView.indexPath(for: cell), let ds = videogamesDS
            {
                let detailedVC = segue.destination as! VideoGameDetailedViewController
                detailedVC.videoGameForThisView(ds.videoGameAt(indexPath.row))
                let backItem = UIBarButtonItem()
                backItem.title = "Search"
                backItem.tintColor = UIColor(hex: "#ffffff")
                navigationItem.backBarButtonItem = backItem
            }
        }
    }
}
