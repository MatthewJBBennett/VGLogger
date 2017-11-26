//
//  FilterSideBarTableViewCell.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/15/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class FilterSideBarTableViewCell: UITableViewCell {

    @IBOutlet weak var sideBarLabel: UILabel!
    @IBOutlet weak var sideBarSwitch: UISwitch!
    
    var index: IndexPath = IndexPath()
    var source: FilterSideBarTableViewController? = nil
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func switchToggled(_ sender: UISwitch) {
        //section 0 contains platforms
        if index.section == 0 {
            source?.updateSwitchState(index: index.row)
        }
            
            //section 1 contains genres
        else if index.section == 1 {
            source?.updateSwitchState(index: index.row + (source?.platforms.count)!)
        }
            
            //section 2 contains esrb
        else if index.section == 2 {
            source?.updateSwitchState(index: index.row + (source?.genres.count)! + (source?.platforms.count)!)
        }
    }
    
    func setCell(text: String, index: IndexPath, sender: FilterSideBarTableViewController) {
        sideBarLabel.text = text
        self.index = index
        source = sender
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
