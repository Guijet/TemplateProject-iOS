//
//  VCFinalRegister.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-07.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class VCFinalRegister: UIViewController {
    
    //var isPicked =
    var firstName = "Ben"//:String!
    var lastName = "Charbonneau"//:String!
    var email = "aaa@aaa.ca"//:String!
    var gendre:String!
    var birthDate:String!
    var profileImage = UIImage(named: "instagram")//:UIImage!
    var city:String!
    var country:String!
    var phone:String!
    
    let imvProfile = UIImageView()
    
    let tbUsername = UITextField()
    let tbPassword = UITextField()
    let tbConfirmPassword = UITextField()
    
    let btnGetStarted = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFinalRegisterUI()
        // Do any additional setup after loading the view.
    }
    
    func loadFinalRegisterUI() {
        self.view.backgroundColor = UIColor().hex("#E6E1F1")
        
        let imvBottom = UIImageView()
        
        imvBottom.image = UIImage(named: "Combined Shape")
        imvBottom.frame = CGRect(x: rw(0), y: rh(503), width: rw(375), height: rh(164))
        
        self.view.addSubview(imvBottom)
        
        imvProfile.frame = CGRect(x: rw(123), y: rh(102), width: rw(130), height: rw(130))
        imvProfile.layer.cornerRadius = rw(65)
        imvProfile.layer.masksToBounds = true
        imvProfile.image = profileImage
        
        self.view.addSubview(imvProfile)
        
        tbUsername.frame = CGRect(x: rw(82), y: rh(267), width: rw(212.28), height: rh(28))
        tbUsername.placeholder = "Username"
        tbUsername.textAlignment = .center
        tbUsername.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbUsername.autocapitalizationType = .none
        tbUsername.textColor = UIColor().hex("582FC0")
        self.view.createHR(x: tbUsername.frame.minX, y: tbUsername.frame.maxY + rh(1), width: tbUsername.frame.width, color: UIColor().hex("B8A6E4"))

        
        self.view.addSubview(tbUsername)
        
        //text box password
        tbPassword.frame = CGRect(x: rw(82), y: rh(307), width: rw(212.28), height: rh(28))
        tbPassword.placeholder = "Password"
        tbPassword.textAlignment = .center
        tbPassword.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbPassword.autocapitalizationType = .none
        tbPassword.textColor = UIColor().hex("582FC0")
        self.view.createHR(x: tbPassword.frame.minX, y: tbPassword.frame.maxY + rh(1), width: tbPassword.frame.width, color: UIColor().hex("B8A6E4"))
        
        tbPassword.isSecureTextEntry = true
        
        self.view.addSubview(tbPassword)
        
        //text box confirm password
        tbConfirmPassword.frame = CGRect(x: rw(82), y: rh(347), width: rw(212.28), height: rh(28))
        tbConfirmPassword.placeholder = "Confirm password"
        tbConfirmPassword.textAlignment = .center
        tbConfirmPassword.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbConfirmPassword.autocapitalizationType = .none
        tbConfirmPassword.textColor = UIColor().hex("582FC0")
        self.view.createHR(x: tbConfirmPassword.frame.minX, y: tbConfirmPassword.frame.maxY + rh(1), width: tbConfirmPassword.frame.width, color: UIColor().hex("B8A6E4"))
        
        tbConfirmPassword.isSecureTextEntry = true
        
        self.view.addSubview(tbConfirmPassword)
        
        //next button
        btnGetStarted.backgroundColor = UIColor().hex("#582FC0")
        btnGetStarted.frame = CGRect(x: rw(77), y: rh(578), width: rw(222), height: rh(47))
        btnGetStarted.layer.cornerRadius = rw(4)
        btnGetStarted.setTitle("Get Started", for: .normal)
        btnGetStarted.titleLabel?.font = UIFont(name: "Lato-Regular", size: rw(15))
        btnGetStarted.setTitleColor(UIColor().hex("#FFFFFF"), for: .normal)
        
        self.view.addSubview(btnGetStarted)
        
        //move to application view controller
        
        let tapGesturesRegognizer = UITapGestureRecognizer(target: self, action: #selector(endWriting(sender:)))
        self.view.addGestureRecognizer(tapGesturesRegognizer)

    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    @objc func endWriting(sender:UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
