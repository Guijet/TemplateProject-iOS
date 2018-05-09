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
            
            if let token = data["token"] as? String {
                Global.shared.token = token
                
                let getUser = Utility().getJson(url: "\(Global.shared.url)auth/me?", method: "GET", needToken: true)
                
                let userData = getUser.getDict()
                
                let userInfo = userData["current_user"] as! [String:Any]
                
                let ageInt:NSInteger = userInfo["age"] as! NSInteger
                let ageString = String(ageInt)
                
                Global.shared.user = User(email: userInfo["email"]! as! String, firstName: userInfo["first_name"]! as! String, lastName: userInfo["last_name"]! as! String, birthdate: userInfo["birthdate"]! as! String, city: userInfo["city"]! as! String, country: userInfo["country"]! as! String, gender: userInfo["gender"]! as! String, age: ageString, phone: userInfo["phone"]! as! String, username: userInfo["username"]! as! String, profileImageUrl: userInfo["profile_image_url"]! as! String, coverImageUrl: userInfo["cover_image_url"]! as! String)
                
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
    
    func verifyEmail(email:String) -> RequestObject{
        let reqObj = RequestObject()
        
        let response = Utility().getJson(url: "\(Global.shared.url)verifyemail", method: "POST", body: "email=\(email)")
        
        let data = response.getDict()
        
        if !response.getIsError() {
            if let _ = data["status"] as? String {
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
    
    func verifyRegister(email:String, username:String, password:String, confirmedPassword:String, firstName:String, lastName:String, birthdate:String, city:String, country:String, gender:String, age:String, profileImage:UIImage, phone:String) -> RequestObject {
        let imageBase64 = profileImage.imageToBase64()
        
        let reqObj = RequestObject()
        
        let reqString = "email=\(email)&password=\(password)&password_confirmation=\(confirmedPassword)&first_name=\(firstName)&last_name=\(lastName)&birthdate=\(birthdate)&city=\(city)&country=\(country)&gender=\(gender)&age=\(age)&profile_image=\(imageBase64)&phone=\(phone)&username=\(username)"
        
        let response = Utility().getJson(url: "\(Global.shared.url)auth/signup", method: "POST", body: reqString)
        
        let data = response.getDict()
        
        print(imageBase64)
        
        if !response.getIsError() {
            if let _ = data["status"] as? String {
                if let token = data["token"] {
                    Global.shared.token = token as? String
                }
                
                let userData = data["user"] as! [String:Any]
                
                reqObj.serverMsg = ""
                reqObj.validConnexion = true
                
                Global.shared.user = User(email: userData["email"] as! String, firstName: userData["first_name"] as! String, lastName: userData["last_name"] as! String, birthdate: userData["birthdate"] as! String, city: userData["city"] as! String, country: userData["country"] as! String, gender: userData["gender"] as! String, age: userData["age"] as! String, phone: userData["phone"] as! String, username: userData["username"] as! String, profileImageUrl: data["profile_image_url"] as! String, coverImageUrl: userData["cover_image_url"] as! String)
                
                print("YOU IN NIBBA")
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
}
