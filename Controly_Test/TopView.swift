//
//  TopView.swift
//  Controly_Test
//
//  Created by MacBook on 27/07/16.
//  Copyright © 2016 Fabio Takahara. All rights reserved.
//

import UIKit

class TopView: UIView {
    
    //Outlet
    @IBOutlet weak var saldoLabel: UILabel!
    @IBOutlet weak var saldoHeaderValueLabel: UILabel!
    @IBOutlet weak var disponivelLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var realLabel: UILabel!
    @IBOutlet weak var centsLabel: UILabel!
    
    //Constraints
    @IBOutlet weak var verticalConstraint: NSLayoutConstraint!
    @IBOutlet weak var verticalHeaderValueConstaint: NSLayoutConstraint!
    
    //Class
    var lastFrame = CGRect()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //Load Xib into View
        if let nibsView = NSBundle.mainBundle().loadNibNamed("TopView", owner: self, options: nil) as? [UIView] {
            let nibRoot = nibsView[0]
            self.addSubview(nibRoot)
            nibRoot.frame = self.bounds
        }
    }
    
    func performAnimation(status: Bool) {
        
        if status {  //Hide View
            
            self.lastFrame = self.frame //Set last frame from xib
            
            UIView.animateWithDuration(0.3, animations: { 
                
                self.disponivelLabel.alpha = 0
                
                }, completion: { (true) in
                    
                    UIView.animateWithDuration(0.5) {
                        
                        self.verticalConstraint.constant = -80
                        self.verticalHeaderValueConstaint.constant = 30
                        self.layoutIfNeeded()
                        self.frame = CGRectMake(0, 0, self.frame.size.width, 64)
                        self.translatesAutoresizingMaskIntoConstraints = true
                    }
            })
            
            UIView.animateWithDuration(0.4) {
                
                self.moneyLabel.alpha = 0
                self.realLabel.alpha = 0
                self.centsLabel.alpha = 0
            }
            
        } else {  //Show View
            
            UIView.animateWithDuration(0.7) {
                
                self.disponivelLabel.alpha = 1
                self.moneyLabel.alpha = 1
                self.realLabel.alpha = 1
                self.centsLabel.alpha = 1
            }
            
            UIView.animateWithDuration(0.5) {
                
                self.verticalConstraint.constant = 0
                self.verticalHeaderValueConstaint.constant = 354
                self.layoutIfNeeded()
                self.frame = self.lastFrame

            }
        }
    }
}
