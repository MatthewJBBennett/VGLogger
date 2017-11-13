//
//  BarCode.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/11/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import SwiftyJSON

class BarCode: NSObject {

    //var barcode: [AnyObject]
    var barcode: [JSON]
    /*
     init(videogame: AnyObject) {
     self.videogame = videogame
     super.init()
     }
     */
    init(barCodeData: [JSON]) {
        
        barcode = barCodeData
        //make constructor happy
        //barcode = barCodeData as AnyObject
        
        //probably redundent but eh...
        //if let dictionary = barCodeData as? Dictionary<String, AnyObject> {
        //    barcode = dictionary as! AnyObject
       //}
        
        super.init()
    }
    
    func barCodeName() -> String? {
        if let v = barcode[0]["title"].string {
            return v
        }
        return nil
    }
    
    func barCodePrice() -> Double? {
        if let v = barcode[0]["price"].double {
            return v
        }
        return nil
    }
    
    func barCodeMerchant() -> String? {
        if let v = barcode[0]["merchant"].string {
            return v
        }
        return nil
    }
    
    func barCodeLink() -> String? {
        if let v = barcode[0]["link"].string {
            return v
        }
        return nil
    }
}
