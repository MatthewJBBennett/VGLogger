//
//  FeedViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/2/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var downloadAssistant = Download()
    
  //  @IBOutlet weak var popularGameTable: UITableView!
    @IBOutlet weak var newsTable: UITableView!
    
    //    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//       // downloadAssistant.downloadData()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
    var array1 = ["fruits1", "fruits2", "fruits3"]
    var array2 = ["ve1", "ve2", "ve3"]
    
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
//    {
//        if(tableView == popularGameTable)
//        {
//            return "ESTHEADAER"
//        }
//        return categories[section]
//    }
    
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return categories.count
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //if(tableView == popularGameTable)
        if(tableView == newsTable)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newsCell", for: indexPath) as! NewsCell
            //cell.header.text = array1[indexPath.row]
            //cell.articleTitleLabel.text = array2[indexPath.row]
            return cell
        }
        return cell
        
    }
    
        override func viewDidLoad()
        {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            downloadAssistant.downloadData()
        }
    
        override func didReceiveMemoryWarning()
        {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

}

