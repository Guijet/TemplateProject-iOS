//
//  SecondViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2018-05-05.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent = false
        self.extendedLayoutIncludesOpaqueBars = false
        self.navigationController?.navigationBar.barTintColor = UIColor().hex("582FC0")
        self.view.backgroundColor = UIColor().hex("E6E1F1")
        
        let logo = UIImageView()
        logo.image = UIImage(named: "LogoColor")
        logo.frame = CGRect(x: 0, y: rh(139), width: rw(375), height: rh(528))
        view.addSubview(logo)
        
        
        setTextLogin()
        
    }
    
    func setTextLogin() {
        let txtUserName = UITextField()
        let txtPassword = UITextField()
        
        // Champ user
        txtUserName.frame = CGRect(x: rw(35), y: rh(112), width: rw(307), height: rh(30))
        txtUserName.placeholder = "UserName / Email"
        txtUserName.textAlignment = .center
        txtUserName.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        txtUserName.center.x = self.view.center.x
        
        self.view.addSubview(txtUserName)
        
        self.view.createHR(x: txtUserName.frame.minX, y: txtUserName.frame.maxY + rh(1), width: txtUserName.frame.width, color: UIColor().hex("582FC0"))
        
        // champ Password
        txtPassword.frame = CGRect(x: rw(35), y: rh(180), width: rw(307), height: rh(30))
        txtPassword.placeholder = "Password"
        txtPassword.textAlignment = .center
        txtPassword.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        txtPassword.isSecureTextEntry = true
        self.view.addSubview(txtPassword)
        self.view.createHR(x: txtPassword.frame.minX, y: txtPassword.frame.maxY + rh(1), width: txtPassword.frame.width, color: UIColor().hex("582FC0"))
        
        // Login button
        let btnLogin = UIButton()
        
        btnLogin.backgroundColor = UIColor().hex("582FC0")
        btnLogin.frame = CGRect(x: rw(79), y: txtPassword.frame.maxY + rh(50), width: 217, height: 47)
        btnLogin.center.x = self.view.center.x
        btnLogin.layer.cornerRadius = 4
        btnLogin.setTitle("Login", for: .normal)
        self.view.addSubview(btnLogin)
        
        btnLogin.addTarget(self, action: #selector(toFriendsPage(sender:)), for: .touchUpInside)
        
    }
    
    @objc func toFriendsPage(sender:UIButton) {
        performSegue(withIdentifier: "toFriends", sender: nil)
    }
}
