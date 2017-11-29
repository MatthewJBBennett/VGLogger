//
//  BarCodeTableViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/11/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import Alamofire
import Hex
import SwiftyJSON
import SafariServices

class BarCodeTableViewController: UITableViewController {
    
    var upc: String?
    var barcodeDS: BarCodeDataSource?
    var json: JSON = JSON.null
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    func startIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
    }
    
    func stopIndicator() {
        activityIndicator.stopAnimating()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(hex: "#C0C5CD") 
        
        if let upc = upc {
            apiCall(params: upc)
        }
        print("In barcode TVC, upc is: \(upc!)")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
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
        switch self.json.type {
        case .array, .dictionary:
            //return self.json.count
            if (barcodeDS?.numBarCodeItems())! == 0 {
                let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
                noDataLabel.text          = "No results found"
                noDataLabel.textColor     = UIColor.black
                noDataLabel.textAlignment = .center
                tableView.backgroundView  = noDataLabel
                tableView.separatorStyle  = .none
            }
            return (barcodeDS?.numBarCodeItems())!
        default:
            return 1
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let a = self.json["items"][0]["offers"].arrayValue
        if let startUrl = a[indexPath.item]["link"].string {
            let newUrl = startUrl.replacingOccurrences(of: "\"", with: "", options: NSString.CompareOptions.literal, range:nil)
            if let url = URL(string: newUrl) {
                let config = SFSafariViewController.Configuration()
                config.entersReaderIfAvailable = true
            
                let vc = SFSafariViewController(url: url, configuration: config)
                present(vc, animated: true)
            }
        }
    }

    func setUPC(upc: String) {
        self.upc = upc
    }
    
    func apiCall(params: String) {
        if let url = URL(string: "https://api.upcitemdb.com/prod/trial/lookup?upc=" + "\(params)") {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = HTTPMethod.get.rawValue
            urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
            self.startIndicator()
            Alamofire.request(url, method: .get).validate().responseJSON { response in
                switch response.result {
                case .success(let value):
                    self.json = JSON(value)
                    
                    print("JSON: \(self.json)")
                    let a = self.json["items"][0]["offers"].arrayValue
                    self.barcodeDS = BarCodeDataSource(dataSource: a)
                    
                    /*
                    for object in a {
                        print("Count: \(a.count)")
                    }
                    */
                    
                    //print("json here: \(a[0])")
                    //print("Here: \(a[0]["title"])")
                    self.tableView.reloadData()
                    self.stopIndicator()
                    
                case .failure(let error):
                    print(error)
                }
            }
            /*
            Alamofire.request(urlRequest).responseJSON { response in
                if let JSON = response.result.value as? [AnyObject]  {
                    self.barcodeDS = BarCodeDataSource(dataSource: JSON)
                    self.tableView.reloadData()
                }
                //debugPrint(response)
                print(response)
            }
            */
            //debugPrint(request)
        }
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BarCodeCell", for: indexPath)
        // Configure the cell...
        
        
        if let theCell = cell as? BarCodeTableViewCell, let artist = barcodeDS?.barCodeItemAt(indexPath.row) {
            theCell.useBarCode(artist)
        }
        cell.backgroundColor = UIColor(hex: "#C0C5CD")
        return cell
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
        
        let backItem = UIBarButtonItem()
        backItem.title = "Scan"
        backItem.tintColor = UIColor(hex: "#86B86B")
        navigationItem.backBarButtonItem = backItem
    }
    

}
