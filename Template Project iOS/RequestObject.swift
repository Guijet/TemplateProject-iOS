//
//  RequestObject.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class RequestObject {
    var validConnexion:Bool?
    var content:Any?
    var serverMsg:String?
    
    
    init() {
        self.validConnexion = false
        self.serverMsg = ""
        self.content = nil
    }
}
