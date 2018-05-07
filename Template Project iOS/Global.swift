//
//  Global.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-05.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class Global{
    static let shared:Global = {let instance = Global(); return instance}()
    
    var token:String?
    var tokenFB:String?
    var url:String = "http://192.168.0.155/Artifex-API/public/"
    var user:User?
}
