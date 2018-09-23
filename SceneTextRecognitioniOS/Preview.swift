//
//  Preview.swift
//  SceneTextRecognitioniOS
//
//  Created by Khurram Shehzad on 09/08/2017.
//  Copyright © 2017 devcrew. All rights reserved.
//

import UIKit
import Vision
import AVFoundation

class CameraView: UIView {
    private var maskLayer = [CALayer]()
    
var videoPreviewLayer: AVCaptureVideoPreviewLayer {
    guard let layer = layer as? AVCaptureVideoPreviewLayer else {
        fatalError("Expected `AVCaptureVideoPreviewLayer` type for layer. Check PreviewView.layerClass implementation.")
    }
    return layer
}
var session: AVCaptureSession? {
    get {
        return videoPreviewLayer.session
    }
    set {
        videoPreviewLayer.session = newValue
    }
}
// MARK: UIView
    override class var layerClass: AnyClass {
        return AVCaptureVideoPreviewLayer.self
    }
    
    private func createLayer(in rect: CGRect, color: CGColor) -> CALayer{
        
        let mask = CALayer()
        mask.frame = rect
        mask.borderColor = color
        mask.borderWidth = 2.0
        
        maskLayer.append(mask)
        layer.addSublayer(mask)
        
        return mask
    }
    
    func drawTextRectangle(textRext: VNTextObservation, withColor: CGColor) {
        _ = createLayer(in: textRext.boundingBox, color: withColor)
    }
    
    func removeMask() {
        for mask in maskLayer {
            mask.removeFromSuperlayer()
        }
        maskLayer.removeAll()
    }
}
