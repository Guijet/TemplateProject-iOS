//
//  VCRegister2.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class VCRegister2: UIViewController {

    var firstName:String!
    var lastName:String!
    var email:String!
    var gendre:String!
    var birthDate:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(firstName)
        print(lastName)
        print(email)
        print(gendre)
        print(birthDate)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
