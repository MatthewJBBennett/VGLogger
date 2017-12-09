//
//  FeedCollectionViewCell.swift
//  VGLogger
//
//  Created by student on 12/3/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class FeedCollectionViewCell: UICollectionViewCell
{
    //the game data is located within the collection view cell, not the table view cell
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var gameRating: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
}
