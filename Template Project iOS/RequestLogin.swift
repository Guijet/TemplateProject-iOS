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
                
                var email:String!
                if let emailS = userInfo["email"] as? String{
                    email = emailS
                } else {
                    email = ""
                }
                
                var firstname:String!
                if let firstnameS = userInfo["first_name"] as? String{
                    firstname = firstnameS
                } else {
                    firstname = ""
                }
                
                var lastname:String!
                if let lastnameS = userInfo["last_name"] as? String{
                    lastname = lastnameS
                } else {
                    lastname = ""
                }
                
                var birthdate:String!
                if let birthdateS = userInfo["birthdate"] as? String{
                    birthdate = birthdateS
                } else {
                    birthdate = ""
                }
                
                var city:String!
                if let cityS = userInfo["birthdate"] as? String{
                    city = cityS
                } else {
                    city = ""
                }
                
                var country:String!
                if let countryS = userInfo["country"] as? String{
                    country = countryS
                } else {
                    country = ""
                }
                
                var gender:String!
                if let genderS = userInfo["gender"] as? String{
                    gender = genderS
                } else {
                    gender = ""
                }
                
                var age:Int!
                if let ageN = userInfo["age"] as? NSNumber{
                    age = ageN.intValue
                } else if let ageS = userInfo["age"] as? String {
                    age = Int(ageS)
                } else {
                    age = 0
                }
                
                var phone:String!
                if let phoneS = userInfo["phone"] as? String{
                    phone = phoneS
                } else {
                    phone = ""
                }
                
                var username:String!
                if let usernameS = userInfo["username"] as? String{
                    username = usernameS
                } else {
                    username = ""
                }
                
                var profileImageUrl:String!
                if let profileImageUrlS = userInfo["profile_image_url"] as? String{
                    profileImageUrl = profileImageUrlS
                } else {
                    profileImageUrl = ""
                }
                
                var coverImageUrl:String!
                if let coverImageUrlS = userInfo["cover_image_url"] as? String{
                    coverImageUrl = coverImageUrlS
                } else {
                    coverImageUrl = ""
                }
                
                Global.shared.user = User(email: email, firstName: firstname, lastName: lastname, birthdate: birthdate, city: city, country: country, gender: gender, age: age, phone: phone, username: username, profileImageUrl: profileImageUrl, coverImageUrl: coverImageUrl)
                
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
    
    func verifyRegister(email:String, username:String, password:String, confirmedPassword:String, firstName:String, lastName:String, birthdate:String, city:String, country:String, gender:String, age:Int, profileImage:UIImage, phone:String) -> RequestObject {
        var imageBase64 = profileImage.imageToBase64()
        
        imageBase64 = imageBase64.replacingOccurrences(of: "+", with: "%2B")
        imageBase64 = imageBase64.replacingOccurrences(of: "/", with: "%2F")
        imageBase64 = imageBase64.replacingOccurrences(of: "=", with: "%3D")
        
        let reqObj = RequestObject()
        
        let reqString = "email=\(email)&password=\(password)&password_confirmation=\(confirmedPassword)&first_name=\(firstName)&last_name=\(lastName)&birthdate=\(birthdate)&city=\(city)&country=\(country)&gender=\(gender)&age=\(age)&profile_image=\(imageBase64)&phone=\(phone)&username=\(username)"
        
        let response = Utility().getJson(url: "\(Global.shared.url)auth/signup", method: "POST", body: reqString)
        
        let data = response.getDict()
        
        if !response.getIsError() {
            if let _ = data["status"] as? String {
                if let token = data["token"] {
                    Global.shared.token = token as? String
                }
                
                let userData = data["user"] as! [String:Any]
                
                reqObj.serverMsg = ""
                reqObj.validConnexion = true
                
                var email:String!
                if let emailS = userData["email"] as? String{
                    email = emailS
                } else {
                    email = ""
                }
                
                var firstname:String!
                if let firstnameS = userData["first_name"] as? String{
                    firstname = firstnameS
                } else {
                    firstname = ""
                }
                
                var lastname:String!
                if let lastnameS = userData["last_name"] as? String{
                    lastname = lastnameS
                } else {
                    lastname = ""
                }
                
                var birthdate:String!
                if let birthdateS = userData["birthdate"] as? String{
                    birthdate = birthdateS
                } else {
                    birthdate = ""
                }
                
                var city:String!
                if let cityS = userData["birthdate"] as? String{
                    city = cityS
                } else {
                    city = ""
                }
                
                var country:String!
                if let countryS = userData["country"] as? String{
                    country = countryS
                } else {
                    country = ""
                }
                
                var gender:String!
                if let genderS = userData["gender"] as? String{
                    gender = genderS
                } else {
                    gender = ""
                }
                
                var age:Int!
                if let ageN = userData["age"] as? NSNumber{
                    age = ageN.intValue
                } else if let ageS = userData["age"] as? String {
                    age = Int(ageS)
                } else {
                    age = 0
                }
                
                var phone:String!
                if let phoneS = userData["phone"] as? String{
                    phone = phoneS
                } else {
                    phone = ""
                }
                
                var username:String!
                if let usernameS = userData["username"] as? String{
                    username = usernameS
                } else {
                    username = ""
                }
                
                var profileImageUrl:String!
                if let profileImageUrlS = userData["profile_image_url"] as? String{
                    profileImageUrl = profileImageUrlS
                } else {
                    profileImageUrl = ""
                }
                
                var coverImageUrl:String!
                if let coverImageUrlS = userData["cover_image_url"] as? String{
                    coverImageUrl = coverImageUrlS
                } else {
                    coverImageUrl = ""
                }
                
                Global.shared.user = User(email: email, firstName: firstname, lastName: lastname, birthdate: birthdate, city: city, country: country, gender: gender, age: age, phone: phone, username: username, profileImageUrl: profileImageUrl, coverImageUrl: coverImageUrl)
                
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
