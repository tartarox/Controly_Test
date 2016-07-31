//
//  BottomView.swift
//  Controly_Test
//
//  Created by MacBook on 27/07/16.
//  Copyright © 2016 Fabio Takahara. All rights reserved.
//

import UIKit

class BottomView: UIView {
    
    
    
    //Outlet
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerLineView: UIView!
    @IBOutlet weak var objectiveLabel: UILabel!
    @IBOutlet weak var currentLabel: UILabel!
    @IBOutlet weak var currentValueLabel: UILabel!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var targetValueLabel: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    @IBOutlet weak var hidePercentageLabel: UILabel!
    
    //Constraints
    @IBOutlet weak var objectiveLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var objectiveTopContraint: NSLayoutConstraint!
    @IBOutlet weak var currentLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var currentValueLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var targetLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var targetValueLeftConstraint: NSLayoutConstraint!
    @IBOutlet weak var hidePercentageLeftConstraint: NSLayoutConstraint!
    
    //Class
    var lastFrame = CGRect()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //Load Xib into View
        if let nibsView = NSBundle.mainBundle().loadNibNamed("BottomView", owner: self, options: nil) as? [UIView] {
            let nibRoot = nibsView[0]
            self.addSubview(nibRoot)
            nibRoot.frame = self.bounds
        }
    }
    
    func performAnimation(status: Bool) {
        
        if status {  //Hide View
            
            self.lastFrame = self.frame //Set last frame from xib
            
            UIView.animateWithDuration(0.3, animations: {
                
                self.headerLabel.alpha = 0
                self.headerLineView.alpha = 0
                
                self.currentLabel.alpha = 0
                self.currentValueLabel.alpha = 0
                self.targetLabel.alpha = 0
                self.targetValueLabel.alpha = 0
                
                self.currentLeftConstraint.constant = 10
                self.currentValueLeftConstraint.constant = 34
                self.targetLeftConstraint.constant = 10
                self.targetValueLeftConstraint.constant = 34
                
                self.layoutIfNeeded()
                
                }, completion: { (true) in
                    
                    UIView.animateWithDuration(0.5) {
                        
                        self.objectiveLabel.alpha = 0.6
                        
                        self.hidePercentageLeftConstraint.constant = 220
                        
                        self.objectiveLeftConstraint.constant = 102
                        self.objectiveTopContraint.constant = 13
                        
                        self.layoutIfNeeded()
                        self.translatesAutoresizingMaskIntoConstraints = true
                        
                        self.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height - 50, self.frame.size.width, 50)
                    }
            })
            
            UIView.animateWithDuration(0.6) {
                
                self.percentageLabel.alpha = 0
                
            }
            
        } else {  //Show View
            
            UIView.animateWithDuration(0.5, animations: {
                
                self.headerLabel.alpha = 1
                self.headerLineView.alpha = 1
                self.objectiveLabel.alpha = 1
                
                self.objectiveLeftConstraint.constant = 20
                self.objectiveTopContraint.constant = 56
                self.hidePercentageLeftConstraint.constant = 602
                
                self.layoutIfNeeded()
                
                self.frame = self.lastFrame
                
                }, completion: { (true) in
                    
                    UIView.animateWithDuration(0.3) {
                        
                        self.percentageLabel.alpha = 1
                        
                        self.currentLabel.alpha = 1
                        self.currentValueLabel.alpha = 1
                        self.targetLabel.alpha = 1
                        self.targetValueLabel.alpha = 1
                        
                        self.currentLeftConstraint.constant = 18
                        self.currentValueLeftConstraint.constant = 14
                        self.targetLeftConstraint.constant = 18
                        self.targetValueLeftConstraint.constant = 14
                        
                        self.layoutIfNeeded()
                        
                    }
            })
        }
    }
}
