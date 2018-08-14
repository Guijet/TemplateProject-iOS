//
//  Global.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-08-14.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class Global{
    static let shared:Global = {let instance = Global(); return instance}()
    
    var token:String?
    
    func isIphoneX()->Bool{
        return UIDevice().userInterfaceIdiom == .phone && UIScreen.main.nativeBounds.height == 2436
    }
}
