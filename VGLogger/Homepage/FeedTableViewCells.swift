//
//  FeedTableViewCells.swift
//  VGLogger
//
//  Created by student on 12/3/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class PopularGameTableViewCell: UITableViewCell
{
    
    @IBOutlet weak var collectionview: UICollectionView!    //collection view within the popular game table view cell
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}

class NewsTableViewCell: UITableViewCell
{
    
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

