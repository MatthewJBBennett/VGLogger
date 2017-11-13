//
//  BarCodeTableViewCell.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/11/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit

class BarCodeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var priceCell: UILabel!
    @IBOutlet weak var merchantCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func useBarCode(_ barcode: BarCode) {
        //if let aImage = videogame.getImage()  {
        //    cellImage.image = aImage
        //}
        titleCell.text = barcode.barCodeName()
        //priceCell.text = ("\(barcode.barCodePrice()!.rounded())")
        priceCell.text = "$" + String(format: "%.2f", barcode.barCodePrice()!)
        merchantCell.text = barcode.barCodeMerchant()
        
    }

}
