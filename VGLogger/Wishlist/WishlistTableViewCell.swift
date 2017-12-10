//
//  WishlistTableViewCell.swift
//  VGLogger
//
//  Created by student on 11/29/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class WishlistTableViewCell: UITableViewCell {
    
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameCoverImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setWishlistCell(_ title: String, coverURL: String){
        //Create the proper URL for the cover image of a particular game and set the data for each cell
        gameTitleLabel.text = title
        let newUrl = "https://images.igdb.com/igdb/image/upload/t_thumb_2x/" + coverURL + ".jpg"
        if let url = URL(string: newUrl), let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                gameCoverImage.image = image
        }
    }
}
