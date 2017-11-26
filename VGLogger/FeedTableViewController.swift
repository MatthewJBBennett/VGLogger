//
//  FirstViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/2/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class FeedTableViewController: UITableViewController {

    var downloadAssistant = Download()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = UIColor(hex: "#C0C5CD")
        self.title = "News"
        // Do any additional setup after loading the view, typically from a nib.
       // downloadAssistant.downloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

