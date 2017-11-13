//
//  BarCodeDataSource.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/11/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import SwiftyJSON

class BarCodeDataSource: NSObject {

    var barcodes: [JSON]
    
    init(dataSource: [JSON]) {
        barcodes = dataSource
        super.init()
    }
    
    
    func numBarCodeItems() -> Int{
        print("NumBarCodeItems: \(barcodes.count)")
        return barcodes.count
    }
    
    func barCodeItemAt(_ index: Int) -> BarCode {
        
        let barcode = BarCode( barCodeData: [barcodes[index]] )
        return barcode
    }
}
