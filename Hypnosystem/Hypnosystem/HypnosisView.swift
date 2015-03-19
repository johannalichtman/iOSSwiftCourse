//
//  HypnosisView.swift
//  Hypnosystem
//
//  Created by Johanna Lichtman on 2/16/15.
//  Copyright (c) 2015 Johanna Lichtman. All rights reserved.
//

import UIKit

class HypnosisView: UIView {

    var radiusOffset: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    var timer: NSTimer?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func drawRect(rect: CGRect) {
        let bounds = self.bounds
        
        let centerX = bounds.origin.x + bounds.size.width / 2.0
        let centerY = bounds.origin.y + bounds.size.height / 2.0
        let center = CGPoint(x: centerX, y: centerY)
        
        let maxRadius = CGFloat(hypot(CDouble(bounds.size.width), CDouble(bounds.size.height)) / 2.0)
        
        for var radius: CGFloat = 0.0; radius < maxRadius; radius += 20{
            
            let path = UIBezierPath()
            
            // Add an arc to the path at center, with radius of radius
            // from 0 to 2*PI radians (a circle)
            
            path.addArcWithCenter(center,
                radius: radius + radiusOffset,
                startAngle: 0,
                endAngle: CGFloat(M_PI * 2.0),
                clockwise: true)
            
            path.lineWidth = 10.0
            let alpha = ((radius + radiusOffset - 10) / maxRadius)
            UIColor.purpleColor().colorWithAlphaComponent(alpha).setStroke()
            
            // Draw the line
            path.stroke()
        }
    }
    
    override func didMoveToSuperview() {
        if superview != nil{
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0/30.0, target: self, selector: "timerFired:", userInfo: nil, repeats: true)
        }
    }
    
    override func removeFromSuperview() {
        timer?.invalidate()
        timer = nil
        super.removeFromSuperview()
    }
    
    func timerFired(timer: NSTimer){
        println("pew")
        radiusOffset += 1.0
        if radiusOffset > 20 {
            radiusOffset = 0
        }
    }

}