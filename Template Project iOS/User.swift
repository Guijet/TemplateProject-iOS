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
    var age:String!
    var phone:String!
    var username:String!
    var id:Int!
    var profileImageUrl:String!
    var coverImageUrl:String!
    
    init(email:String, firstName:String, lastName:String, birthdate:String, city:String, country:String, gender:String, age:String, phone:String, username:String, id:Int, profileImageUrl:String, coverImageUrl:String) {
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
        self.id = id
        self.profileImageUrl = profileImageUrl
        self.coverImageUrl = coverImageUrl
    }
}
