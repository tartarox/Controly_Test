//
//  BarManager.swift
//  Controly_Test
//
//  Created by Fabio Yudi Takahara on 30/07/16.
//  Copyright © 2016 Fabio Takahara. All rights reserved.
//

import UIKit

class BarManager: NSObject {
    
    class func loadDefaultBar() -> NSArray {
        
        let barArray: NSMutableArray = []
        
        let barObject1 = BarObject.init(barValue: 320, barMaxValue: 840, barIndex: 0, barText: "MAR")
        let barObject2 = BarObject.init(barValue: 220, barMaxValue: 840, barIndex: 1, barText: "ABR")
        let barObject3 = BarObject.init(barValue: 462, barMaxValue: 840, barIndex: 2, barText: "MAI")
        let barObject4 = BarObject.init(barValue: 620, barMaxValue: 840, barIndex: 3, barText: "JUN")
        let barObject5 = BarObject.init(barValue: 840, barMaxValue: 840, barIndex: 4, barText: "ATUAL")
        
        barArray.addObject(barObject1)
        barArray.addObject(barObject2)
        barArray.addObject(barObject3)
        barArray.addObject(barObject4)
        barArray.addObject(barObject5)
        
        return barArray
    }
    
    class func loadFakeBar() -> NSArray {
        
        let barArray: NSMutableArray = []
        
        let barObject1 = BarObject.init(barValue: CGFloat(arc4random_uniform(840)), barMaxValue: 840, barIndex: 0, barText: "1 - 7")
        let barObject2 = BarObject.init(barValue: CGFloat(arc4random_uniform(840)), barMaxValue: 840, barIndex: 1, barText: "8 - 14")
        let barObject3 = BarObject.init(barValue: CGFloat(arc4random_uniform(840)), barMaxValue: 840, barIndex: 2, barText: "15 - 21")
        let barObject4 = BarObject.init(barValue: CGFloat(arc4random_uniform(840)), barMaxValue: 840, barIndex: 3, barText: "22 - 28")
        let barObject5 = BarObject.init(barValue: 840, barMaxValue: 840, barIndex: 4, barText: "ATUAL")
        
        barArray.addObject(barObject1)
        barArray.addObject(barObject2)
        barArray.addObject(barObject3)
        barArray.addObject(barObject4)
        barArray.addObject(barObject5)
        
        return barArray
    }

}
