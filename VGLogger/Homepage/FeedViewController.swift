//
//  FeedViewController.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/2/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    
    @IBOutlet weak var newsTable: UITableView!
    
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

    var downloadAssistant = Download()
    
    //var categories = ["Action", "Drama", "Science Fiction", "Kids", "Horror"]
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        //if(tableView == popularGameTable)
//        if(tableView == newsTable)
//        {
        let cell = tableView.dequeueReusableCell(withIdentifier : "newsCell", for : indexPath) as! NewsTableViewCell
        cell.articleTitleLabel?.text = array1[indexPath.row]
        cell.authorLabel?.text = array2[indexPath.row]
        cell.articleImage?.image = UIImage(named: "https://assets.vg247.com/current//2017/09/destiny_2_emb_strike_the_pyramidion_3.jpg")
        return cell
//        }
    }
    
    //URLs to be opened
    let urlArray = ["https://google.com", "https://apple.com", "https://facebook.com"]
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let urlString = self.urlArray[indexPath.row]
        if let url = URL(string: urlString)
        {
             UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
