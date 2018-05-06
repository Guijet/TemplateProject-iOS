//
//  RequestLogin.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-05.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class RequestLogin{
    static let shared:RequestLogin = {let instance = RequestLogin(); return instance}()
    
    //CHANGE WITH NEW VALIDATION OBJECT
    func login(email:String, password:String) -> RequestObject{
        
        let reqObj = RequestObject()
        
        let response = Utility().getJson(url: "\(Global.shared.url)auth/login", method: "POST", body: "login=\(email)&password=\(password)")
        
        //if server is reached
        if !response.getIsError() {
            let data = response.getDict()
            print(data)
            
            if let token = data["token"] as? String {
                Global.shared.token = token
                reqObj.serverMsg = ""
                reqObj.validConnexion = true
            } else {
                if let errorName = data["error"] as? String {
                    reqObj.serverMsg = errorName
                    reqObj.validConnexion = false
                } else {
                    reqObj.serverMsg = "Unknown error"
                    reqObj.validConnexion = false
                }
            }
            
        } else {
            reqObj.serverMsg = response.getMessage()
            reqObj.validConnexion = false
        }
        
        return reqObj
    }
    
    func verifyEmail(email:String) -> Bool {
        let reqObj = RequestObject()
        
        let response = Utility().getJson(url: "\(Global.shared.url)auth/login", method: "POST", body: "email=\(email)")
    }
}
