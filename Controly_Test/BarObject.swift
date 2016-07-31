//
//  BarObject.swift
//  Controly_Test
//
//  Created by MacBook on 29/07/16.
//  Copyright © 2016 Fabio Takahara. All rights reserved.
//

import UIKit

class BarObject: NSObject {
    
    var barValue:CGFloat = 0
    var barMaxValue:CGFloat = 0
    var barIndex = 0
    var barText = ""
    
    init(barValue:CGFloat, barMaxValue:CGFloat, barIndex:Int, barText:String) {
        
        self.barValue = barValue
        self.barMaxValue = barMaxValue
        self.barIndex = barIndex
        self.barText = barText
        
    }
}
