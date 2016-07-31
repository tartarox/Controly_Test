//
//  GraphView.swift
//  Controly_Test
//
//  Created by MacBook on 29/07/16.
//  Copyright © 2016 Fabio Takahara. All rights reserved.
//

import UIKit

class GraphView: UIView {
    
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    
    @IBOutlet weak var weekCenterConstraint: NSLayoutConstraint!
    @IBOutlet weak var monthCenterConstraint: NSLayoutConstraint!
    
    //Class
    var lastFrame = CGRect()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //Load Xib into View
        if let nibsView = NSBundle.mainBundle().loadNibNamed("GraphView", owner: self, options: nil) as? [UIView] {
            let nibRoot = nibsView[0]
            self.addSubview(nibRoot)
            nibRoot.frame = self.bounds
        }
    }
    
    // Mark: Load Graph
    func loadGraph(barArray:NSArray) {
        
        let barWidth = self.frame.size.width
        
        for barObject in barArray as! [BarObject] {
                
            let barWidth = barWidth / 5   // Apply 5 for display to test, can be more or less
            let graphBarView = GraphBarView.init(barObject: barObject, frame: CGRectMake(CGFloat(barObject.barIndex) * barWidth, self.frame.size.height, barWidth, 0))
            self.addSubview(graphBarView)
            
        }
    }
    
    // Mark: Open/Close Animations
    func performAnimation(status: Bool, barArray:NSArray) {
        
        for view in self.subviews{
            if view .isKindOfClass(GraphBarView) {
                
                let graphBarView = view as! GraphBarView
                graphBarView.dismissGraph()
                
            }
        }
        
        if status {  //Hide View
            
            self.lastFrame = self.frame //Set last frame from xib
            
            UIView.animateWithDuration(0.3, animations: {
                
                self.monthCenterConstraint.constant = -20
                self.monthLabel.alpha = 0
                
                self.layoutIfNeeded()
                
            }) { (true) in
                
                UIView.animateWithDuration(0.5, animations: {
                    
                    self.frame = CGRectMake(0, 64, self.frame.size.width, UIScreen.mainScreen().bounds.size.height - 114)
                    
                    }, completion: { (true) in
                        
                        self.loadGraph(barArray)
                        
                        UIView.animateWithDuration(0.6, animations: {
                            
                            self.weekCenterConstraint.constant = 0
                            self.weekLabel.alpha = 1
                            self.layoutIfNeeded()
                        })
                })
            }
            
        } else {  //Show View
            
            UIView.animateWithDuration(0.5, animations: {
                
                self.weekCenterConstraint.constant = -20
                self.weekLabel.alpha = 0
                self.frame = self.lastFrame
                
                self.layoutIfNeeded()
                
            }) { (true) in
                
                self.loadGraph(barArray)
                
                UIView.animateWithDuration(0.6, animations: {
                    
                    self.monthCenterConstraint.constant = 0
                    self.monthLabel.alpha = 1
                    self.alpha = 1
                    
                    self.layoutIfNeeded()
                    
                })
            }
        }
    }
}
