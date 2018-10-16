//
//  shapeUIView.swift
//  ex00
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/09.
//  Copyright © 2018 Gaolatlhwe SEBAETSE. All rights reserved.
//

import Foundation
import UIKit

class ShapeUIView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame.offsetBy(dx: frame.width/2 * -1, dy: frame.height/2 * -1))
        backgroundColor = randomColor()
        let randomShape = arc4random_uniform(10)
        if randomShape > 5 {
            layer.cornerRadius = frame.height/2 }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func randomColor() -> UIColor {
        return UIColor(displayP3Red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
    }
}
