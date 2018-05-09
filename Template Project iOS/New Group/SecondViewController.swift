//
//  SecondViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2018-05-05.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    let loading = loadingIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor().hex("E6E1F1")
        
        let logo = UIImageView()
        logo.image = UIImage(named: "LogoColor")
        logo.frame = CGRect(x: 0, y: rh(139), width: rw(375), height: rh(528))
        view.addSubview(logo)
        
        
        setTextLogin()
        
        self.navigationController?.navigationBar.isHidden = false
    }
    
    let tbUserName = UITextField()
    let tbPassword = UITextField()
    
    func setTextLogin() {
        
        tbUserName.delegate = self
        tbPassword.delegate = self
        
        // Champ user
        tbUserName.frame = CGRect(x: rw(35), y: rh(112), width: rw(307), height: rh(30))
        tbUserName.placeholder = "UserName / Email"
        tbUserName.textAlignment = .center
        tbUserName.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbUserName.center.x = self.view.center.x
        tbUserName.autocapitalizationType = .none
        
        self.view.addSubview(tbUserName)
        
        self.view.createHR(x: tbUserName.frame.minX, y: tbUserName.frame.maxY + rh(1), width: tbUserName.frame.width, color: UIColor().hex("582FC0"))
        
        // champ Password
        tbPassword.frame = CGRect(x: rw(35), y: rh(180), width: rw(307), height: rh(30))
        tbPassword.placeholder = "Password"
        tbPassword.textAlignment = .center
        tbPassword.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbPassword.isSecureTextEntry = true
        self.view.addSubview(tbPassword)
        self.view.createHR(x: tbPassword.frame.minX, y: tbPassword.frame.maxY + rh(1), width: tbPassword.frame.width, color: UIColor().hex("582FC0"))
        
        // Login button
        let btnLogin = UIButton()
        
        btnLogin.backgroundColor = UIColor().hex("582FC0")
        btnLogin.frame = CGRect(x: rw(79), y: tbPassword.frame.maxY + rh(50), width: 217, height: 47)
        btnLogin.center.x = self.view.center.x
        btnLogin.layer.cornerRadius = 4
        btnLogin.setTitle("Login", for: .normal)
        self.view.addSubview(btnLogin)
        
        btnLogin.addTarget(self, action: #selector(toFriendsPage(sender:)), for: .touchUpInside)
        
        let tapGesturesRegognizer = UITapGestureRecognizer(target: self, action: #selector(endWriting(sender:)))
        self.view.addGestureRecognizer(tapGesturesRegognizer)
    }
    
    @objc func endWriting(sender:UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func toFriendsPage(sender:UIButton) {
        if !((tbUserName.text?.isEmpty)! && (tbPassword.text?.isEmpty)!) {
        
            var reqObj:RequestObject!
            
            let email = tbUserName.text!
            let pw = tbPassword.text!
            
            self.loading.startWithKeyWindows()
            DispatchQueue.global(qos: .background).sync {
                reqObj = RequestLogin.shared.login(email: email, password: pw)
                DispatchQueue.main.async {
                    self.loading.removeFromKeyWindow()
                }
            }
            
            if  reqObj.validConnexion! {
                // Change root page to friends after connect
                
                let storyboard = UIStoryboard(name: "Application", bundle: nil)
                let mainPage = storyboard.instantiateViewController(withIdentifier: "FriendsSB") as! UINavigationController
                UIApplication.shared.keyWindow?.rootViewController = mainPage
                
            } else {
                Utility().alert(message: reqObj.serverMsg! , title: "Error occured", control: self)
            }
            
        } else {
            Utility().alert(message: "Enter valid credentials", title: "Fields are empty", control: self)
        }
    }
}
