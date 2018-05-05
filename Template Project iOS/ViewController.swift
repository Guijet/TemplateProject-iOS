//
//  ViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-17.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWelcomePage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationController?.navigationBar.barTintColor = UIColor().hex("#582FC0")
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    func loadWelcomePage() {
        
        //Load Background Image
        let imvMtl = UIImageView()
        let imvLogo = UIImageView()
        
        self.view.backgroundColor? = UIColor().hex("#582FC0")
        imvMtl.image = UIImage(named: "Montreal_NB")
        imvMtl.frame = CGRect(x: 0, y: 0, width: rw(375), height: rh(665))
        self.view.addSubview(imvMtl)
   
        imvLogo.image = UIImage(named: "Logo")
        imvLogo.frame = CGRect(x: 0, y: rh(247), width: rw(321), height: rh(420))
        self.view.addSubview(imvLogo)
        
        //login button
        let btnLogin = UIButton()
        
        btnLogin.backgroundColor = UIColor().hex("#E6E1F1")
        btnLogin.frame = CGRect(x: rw(55), y: rh(105), width: rw(266), height: rh(47))
        btnLogin.layer.cornerRadius = rw(4)
        btnLogin.setTitle("Log in", for: .normal)
        btnLogin.titleLabel?.font = UIFont(name: "Lato-Regular", size: rw(15))
        btnLogin.setTitleColor(UIColor().hex("#582FC0"), for: .normal)
        
        self.view.addSubview(btnLogin)

        
        btnLogin.addTarget(self, action: #selector(toLoginPage(sender:)), for: .touchUpInside)
        
        //login button FB
        let btnFB = UIButton()
        let labFB = UILabel()
        
        btnFB.backgroundColor = UIColor().hex("#5C9DE8")
        btnFB.frame = CGRect(x: rw(55), y: rh(181), width: rw(266), height: rh(47))
        btnFB.layer.cornerRadius = rw(4)
        
        labFB.font = UIFont(name: "Lato-Regular", size: rw(15))
        labFB.textColor = .white
        labFB.frame = CGRect(x: rw(61), y: rh(16), width: rw(188), height: rh(18))
        labFB.text = "Log in with Facebook"
        labFB.textAlignment = .center
        
        
        self.view.addSubview(btnFB)
        btnFB.addSubview(labFB)
        
        
        
        //dont have an account label
        let labRegister = UILabel()
        
        labRegister.font = UIFont(name: "Lato-Regular", size: rw(15))
        labRegister.textColor = .white
        labRegister.frame = CGRect(x: rw(36), y: rh(258), width: rw(306), height: rh(40))
        labRegister.text = "Don't have an account?"
        labRegister.textAlignment = .center
        
        self.view.addSubview(labRegister)
    }
    
    @objc func toLoginPage(sender:Any){
        performSegue(withIdentifier: "toLoginPage", sender: nil)
    }
    
}

