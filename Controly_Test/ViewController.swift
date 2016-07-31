//
//  ViewController.swift
//  Controly_Test
//
//  Created by MacBook on 27/07/16.
//  Copyright © 2016 Fabio Takahara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topView: TopView!
    @IBOutlet weak var bottomView: BottomView!
    @IBOutlet weak var centerView: GraphView!
    
    var animationControl = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

        self.centerView.loadGraph(BarManager.loadDefaultBar())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func performGraphAction(sender: UIButton) {
        
        self.animationControl = !self.animationControl
        
        self.topView.performAnimation(self.animationControl)
        self.bottomView.performAnimation(self.animationControl)
        
        if self.animationControl {
            
            self.centerView.performAnimation(self.animationControl, barArray: BarManager.loadFakeBar())
            
        } else {
            
            self.centerView.performAnimation(self.animationControl, barArray: BarManager.loadDefaultBar())
            
        }
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
}

