
//
//  CustomLoader.swift
//  sample
//
//  Created by Vinay Raj K on 08/08/19.
//  Copyright © 2019 Vinay Raj K. All rights reserved.
//

import UIKit

class CustomLoader: UIView {
    
    var finalBezierpath = UIBezierPath()
    

    var trailingLayer = CAShapeLayer()
    
    var numberOfTriangles: Int = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        createShape()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        createShape()
    }
    
    func createShape() {
        
        for i in 0..<numberOfTriangles{
            addPaths(iter: CGFloat(i))
        }
        trailingLayer.path = finalBezierpath.cgPath
        trailingLayer.strokeColor = UIColor.blue.cgColor
        trailingLayer.fillColor = nil
        trailingLayer.lineWidth = 1.0
        trailingLayer.lineCap = .round
        layer.addSublayer(trailingLayer)
    }

    func addPaths(iter: CGFloat){
        let bezierPath1 = UIBezierPath()
        let bezierPath2 = UIBezierPath()
        let startPoint = CGPoint(x: bounds.width*iter/CGFloat(numberOfTriangles), y: bounds.height)
        let endPoint = CGPoint(x: bounds.width*(iter*2+1)/CGFloat(numberOfTriangles*2), y: bounds.origin.y)
        bezierPath1.move(to: startPoint)
        bezierPath1.addLine(to: endPoint)
        
        let finalEndPoint = CGPoint(x: bounds.width*(iter+1)/CGFloat(numberOfTriangles), y: bounds.height)
        bezierPath2.move(to: endPoint)
        bezierPath2.addLine(to: finalEndPoint)
        
        finalBezierpath.append(bezierPath1)
        finalBezierpath.append(bezierPath2)
    }
    
    func startAnimating() {
        CATransaction.begin()
        let groupAnimation = CAAnimationGroup()
        groupAnimation.repeatCount = .infinity
        groupAnimation.duration = 5
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0.0
        animation.toValue = 1.0
        
        let coloranimation =  CABasicAnimation(keyPath: "strokeColor")
        coloranimation.fromValue = UIColor.blue.cgColor
        coloranimation.toValue = UIColor.yellow.cgColor

        groupAnimation.animations = [animation,coloranimation]
        trailingLayer.add(groupAnimation, forKey: nil)
        
        CATransaction.commit()
    }
    
}
