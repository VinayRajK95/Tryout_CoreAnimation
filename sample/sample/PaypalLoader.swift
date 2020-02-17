//
//  PaypalLoader.swift
//  sample
//
//  Created by Vinay Raj K on 22/08/19.
//  Copyright © 2019 Vinay Raj K. All rights reserved.
//

import UIKit

class PaypalLoader: UIView {

    var circularBezPath: UIBezierPath?
    
    var baseLayer: CAShapeLayer?
    
    var animatingLayer: CAShapeLayer?
    
    var gradient: CAGradientLayer?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        createShape()
        startAnimating()
    }
    
    func createShape() {
        
        let center = bounds.width/2
        let radius = bounds.width/2
        
        circularBezPath = UIBezierPath(arcCenter: CGPoint(x: center, y: center), radius: radius, startAngle: 0, endAngle: .pi*2, clockwise: true)
        
        baseLayer = CAShapeLayer()
        baseLayer?.path = circularBezPath?.cgPath
        baseLayer?.fillColor = nil
        baseLayer?.strokeColor = UIColor.blue.cgColor
        baseLayer?.lineWidth = 2.0
        
        let quarterBezierPath = UIBezierPath(arcCenter: CGPoint(x: center, y: center), radius: radius, startAngle: 0, endAngle: .pi/2, clockwise: true)
        animatingLayer = CAShapeLayer()
        baseLayer?.path = quarterBezierPath.cgPath
        baseLayer?.fillColor = nil
        baseLayer?.strokeColor = nil
        baseLayer?.lineWidth = 2.0
        
        gradient = CAGradientLayer(layer: animatingLayer!)
        gradient?.colors = [UIColor.blue,UIColor.clear]
        
        self.layer.addSublayer(baseLayer!)
        
        
    }

    
    func startAnimating() {
        
    }
}
