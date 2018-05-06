//
//  ViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-17.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController,UITextFieldDelegate {


    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadWelcomePage()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        let lblFB = UILabel()
        let imvFB = UIImageView()
        
        btnFB.backgroundColor = UIColor().hex("#5C9DE8")
        btnFB.frame = CGRect(x: rw(55), y: rh(181), width: rw(266), height: rh(47))
        btnFB.layer.cornerRadius = rw(4)
        
        lblFB.font = UIFont(name: "Lato-Regular", size: rw(15))
        lblFB.textColor = .white
        lblFB.frame = CGRect(x: rw(61), y: rh(16), width: rw(188), height: rh(18))
        lblFB.text = "Log in with Facebook"
        lblFB.textAlignment = .center
        
        imvFB.image = UIImage(named: "Facebook")
        imvFB.contentMode = .scaleAspectFit
        imvFB.frame = CGRect(x: rw(18), y: rh(6), width: rw(35), height: rh(35))
    
        self.view.addSubview(btnFB)
        btnFB.addSubview(lblFB)
        btnFB.addSubview(imvFB)
        
        btnFB.addTarget(self, action: #selector(loginFacebookAction(sender:)), for: .touchUpInside)
        
        
        //register button
        let btnRegister = UIButton()
        
        btnRegister.titleLabel?.font = UIFont(name: "Lato-Regular", size: rw(15))
        btnRegister.setTitleColor(.white, for: .normal)
        btnRegister.frame = CGRect(x: rw(36), y: rh(258), width: rw(306), height: rh(40))
        btnRegister.setTitle("Don't have an account?", for: .normal)
        //labRegister.textAlignment = .center
        
        self.view.addSubview(btnRegister)
        
        btnRegister.addTarget(self, action: #selector(toRegisterPage(sender:)), for: .touchUpInside)
    }
    
    @objc func toRegisterPage(sender:Any) {
        performSegue(withIdentifier: "toRegister", sender: nil)
    }
    
    @objc func toLoginPage(sender:Any){
        performSegue(withIdentifier: "toLoginPage", sender: nil)
    }
    
    // pop up for fb login
    @objc func loginFacebookAction(sender: AnyObject) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) -> Void in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if(fbloginresult.grantedPermissions != nil){
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        //data fetch code
                        self.fetchProfile()
                        
                    }
                    else{
                        return
                    }
                }
                else{
                    return
                }
            }
        }
    }
    
    //get profile data
    @objc func fetchProfile(){
        let parameters: [String: Any] = ["fields": "email,first_name,last_name,birthday"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: { (connection, result, error) -> Void in
            if ((error) != nil)
            {
                Utility().alert(message: "Error: \(String(describing: error))", title: "Erreur", control: self)
            }
            else{
                print("tokenFB : \(FBSDKAccessToken.current().tokenString!)")
                Global.shared.tokenFB = FBSDKAccessToken.current().tokenString!

            }
        })
    }
    
}

