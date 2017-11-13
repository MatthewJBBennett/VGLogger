//
//  CameraView.swift
//  VGLogger
//
//  Created by Matthew Bennett on 11/8/17.
//  Copyright © 2017 SSU470. All rights reserved.
//

import UIKit
import AVFoundation

class CameraView: UIView {

    override class var layerClass: AnyClass {
        get {
            return AVCaptureVideoPreviewLayer.self
        }
    }
    
    override var layer: AVCaptureVideoPreviewLayer {
        get {
            return super.layer as! AVCaptureVideoPreviewLayer
        }
    }
}
