//
//  User.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-07.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class User {
    var email:String!
    var firstName:String!
    var lastName:String!
    var birthdate:String!
    var city:String!
    var country:String!
    var gender:String!
    var age:Int!
    var phone:String!
    var username:String!
    var profileImageUrl:String!
    var coverImageUrl:String!
    
    init() {
        self.email = ""
        self.firstName = ""
        self.lastName = ""
        self.birthdate = ""
        self.city = ""
        self.country = ""
        self.gender = ""
        self.age = 0
        self.phone = ""
        self.username = ""
        self.profileImageUrl = ""
        self.coverImageUrl = ""
    }
    
    init(email:String, firstName:String, lastName:String, birthdate:String, city:String, country:String, gender:String, age:Int, phone:String, username:String, profileImageUrl:String, coverImageUrl:String) {
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.birthdate = birthdate
        self.city = city
        self.country = country
        self.gender = gender
        self.age = age
        self.phone = phone
        self.username = username
        self.profileImageUrl = profileImageUrl
        self.coverImageUrl = coverImageUrl
    }
}
