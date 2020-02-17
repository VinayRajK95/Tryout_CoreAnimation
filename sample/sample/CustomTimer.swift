//
//  CustomTimer.swift
//  sample
//
//  Created by Vinay Raj K on 30/07/19.
//  Copyright © 2019 Vinay Raj K. All rights reserved.
//

import UIKit

class CustomTimer: UIView {

    var bgPath: UIBezierPath!
    var shapeLayer: CAShapeLayer!
    var progressLayer: CAShapeLayer!
    
    var progress: Float = 0 {
        willSet(newValue)
        {
            progressLayer.strokeEnd = CGFloat(newValue)
        }
    }
    
    let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = NSTextAlignment.left
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.caption1)
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(label)
        addConstraints()
        backgroundColor = .clear
    }

    private func addConstraints() {
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func createCirclePath() {
        let x = self.frame.width/2
        let y = self.frame.height/2
        let center = CGPoint(x: x, y: y)
        bgPath = UIBezierPath(arcCenter: center, radius: x, startAngle: CGFloat(-3.14/2), endAngle: CGFloat(-3.14/2+2*3.14), clockwise: true)
        bgPath.close()
    }
    
    func simpleShape() {
        createCirclePath()
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = bgPath.cgPath
        shapeLayer.lineWidth = 5
        shapeLayer.fillColor = nil
        shapeLayer.strokeColor = UIColor.yellow.cgColor


        progressLayer = CAShapeLayer()
        progressLayer.path = bgPath.cgPath
        progressLayer.lineWidth = 5
        progressLayer.lineCap = CAShapeLayerLineCap.round
        progressLayer.fillColor = nil
        progressLayer.strokeColor = UIColor.blue.cgColor
        progressLayer.strokeEnd = 0.0
        self.layer.addSublayer(shapeLayer)
        self.layer.addSublayer(progressLayer)
    }
    
}
