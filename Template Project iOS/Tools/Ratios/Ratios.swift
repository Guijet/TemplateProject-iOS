//
//  Ratios.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-20.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

//rw: Ratio Width used for dynamic elements in code
//based on iphone 6 frame
//
//rh: Ration height used for dynamic elements in code
//based on iphone 6 frame
//
extension UIViewController {
    func rw(_ val: CGFloat) -> CGFloat {
        return val * (self.view.frame.width / 375)
    }
    func rh(_ val: CGFloat) -> CGFloat {
        return val * (self.view.frame.height / 667)
    }
}



