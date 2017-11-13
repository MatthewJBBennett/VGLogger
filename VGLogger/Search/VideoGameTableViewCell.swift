//
//  VideoGameTableViewCell.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/5/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class VideoGameTableViewCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func useVideoGame(_ videogame: VideoGame) {
        //if let aImage = videogame.getImage()  {
        //    cellImage.image = aImage
        //}
        cellLabel.text = videogame.videoGameName()
    }
}
