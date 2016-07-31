//
//  GraphBarView.swift
//  Controly_Test
//
//  Created by MacBook on 29/07/16.
//  Copyright © 2016 Fabio Takahara. All rights reserved.
//

import UIKit

class GraphBarView: UIView {

    init(barObject: BarObject, frame: CGRect)
    {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.init(red: 0, green: 1, blue: 0, alpha: 0.6)
        
        let barColor = self.barColor(barObject.barValue, maxHeigh: barObject.barMaxValue)
        let barHeight = ((frame.origin.y - 70) * barObject.barValue) / barObject.barMaxValue // Height to render
        
        var newFrame = frame
        newFrame.size.height = CGFloat(-barHeight)
        
        let animationTime = (Double(barObject.barIndex) * 0.4) + 0.5
        
        //render Labels
        let contentLabel = UILabel.init(frame: CGRectMake(0, barHeight - 20, frame.size.width, 20))
        contentLabel.textColor = UIColor.whiteColor()
        contentLabel.text = barObject.barText
        contentLabel.textAlignment = NSTextAlignment.Center
        contentLabel.font = UIFont.boldSystemFontOfSize(16)
        contentLabel.layer.shadowOffset = CGSize(width: 1, height: 1)
        contentLabel.layer.shadowOpacity = 0.7
        contentLabel.layer.shadowRadius = 2
        self.addSubview(contentLabel)
        
        let valueLabel = UILabel.init(frame: CGRectMake(0, -30, frame.size.width, 20))
        valueLabel.textColor = UIColor.darkGrayColor()
        valueLabel.text = String(format: "R$ %i", Int(barObject.barValue))
        valueLabel.alpha = 0
        valueLabel.textAlignment = NSTextAlignment.Center
        valueLabel.font = UIFont.boldSystemFontOfSize(12)
        self.addSubview(valueLabel)
        
        // Do animation
        UIView.animateWithDuration(animationTime, animations: { 
            
            self.frame = newFrame
            self.backgroundColor = barColor
            
            }) { (true) in
                
                var valueFrame = valueLabel.frame
                valueFrame.origin.y = valueFrame.origin.y + 10
                
                UIView.animateWithDuration(0.5, animations: {
                    
                    valueLabel.frame = valueFrame
                    valueLabel.alpha = 0.9
                })
        }
    }
    
    // Fade out this graph and remove from superview
    func dismissGraph() {
        
        var newFrame = self.frame
        newFrame.origin.y = 460
        newFrame.size.height = 0
        
        UIView.animateWithDuration(0.5, animations: {
            
            self.frame = newFrame
            self.alpha = 0
            
            }) { (true) in
                self.removeFromSuperview()
        }
    }
    
    // Calculate a Graph color
    func barColor(barHeight:CGFloat, maxHeigh:CGFloat) -> UIColor {
        
        let percentageColor = (barHeight * 100) / maxHeigh
        let colorValue = Int((percentageColor * 510) / 100) //To Round
        
        var returnColor = UIColor.greenColor()
    
        if colorValue <= 255 {
            
            returnColor = UIColor.init(red: CGFloat(colorValue)/255.0, green: 1, blue: 0, alpha: 0.6)
            
        } else {
            
            let greenValue = 255 - (colorValue - 255)
            returnColor = UIColor.init(red: 1, green: CGFloat(greenValue)/255.0, blue: 0, alpha: 0.6)
            
        }
        
        return returnColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
