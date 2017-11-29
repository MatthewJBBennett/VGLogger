//
//  PopularGamesCell.swift
//  VGLogger
//
//  Created by student on 11/15/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

//class PopularGameTableViewCell: UITableViewCell
//{
//
//    //@IBOutlet weak var header: UILabel!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//}

class NewsTableViewCell: UITableViewCell
{
    
    //@IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleTitleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
