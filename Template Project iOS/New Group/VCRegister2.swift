//
//  VCRegister2.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class VCRegister2: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    var isPicked = false//:Bool!
    var firstName = "Ben"//:String!
    var lastName = "Charbonneau"//:String!
    var email:String!
    var gendre:String!
    var birthDate:String!
    var profileImage:UIImage?
    
    let imvProfile = UIImageView()
    
    let pickerViewCity = UIPickerView()
    let tbCity = UITextField()
    
    let pickerViewCountry = UIPickerView()
    let tbCountry = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = UIColor().hex("E6E1F1")
        
        setUpPickerCity()
        setUpViewCity()
        setUpPickerCountry()
        setUpViewCountry()
        
        loadRegister2UI()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpPickerCity(){
        
    }
    
    func setUpPickerCountry(){
        
    }
    
    func setUpViewCity(){
        
    }
    
    func setUpViewCountry(){
        
    }

    func loadRegister2UI(){
        let imvBottom = UIImageView()
        
        self.view.backgroundColor = UIColor().hex("#E6E1F1")
        
        imvBottom.image = UIImage(named: "Combined Shape")
        imvBottom.frame = CGRect(x: rw(0), y: rh(503), width: rw(375), height: rh(164))
        
        self.view.addSubview(imvBottom)
        
        imvProfile.frame = CGRect(x: rw(123), y: rh(102), width: rw(130), height: rw(130))
        imvProfile.layer.cornerRadius = rw(65)
        imvProfile.layer.masksToBounds = true
        
        //????
        if isPicked {
            imvProfile.image = profileImage
        } else {
            let profileView = UIView()
            profileView.frame = CGRect(x: rw(122), y: rh(102), width: rw(130), height: rw(130))
            profileView.backgroundColor = UIColor().hex("582FC0")
            
            let lblInitials = UILabel()
            lblInitials.font = UIFont(name: "Lato-Regular", size: rw(72))
            lblInitials.textColor = .white
            lblInitials.textAlignment = .center
            lblInitials.frame = CGRect(x: rw(122), y: rh(102), width: rw(130), height: rw(130))
            
            var letter1:String!
            var letter2:String!
            
            letter1 = String(firstName.substring(from: 0, to: 1)).capitalized
            letter2 = String(lastName.substring(from: 0, to: 1)).capitalized
            lblInitials.text = "\(letter1)\(letter2)"
            
            profileView.addSubview(lblInitials)
            
            imvProfile.image = profileView.getScreenShot()
            
        }
        
        self.view.addSubview(imvProfile)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "a" //TEMPORAIRE
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 1 //TEMPORAIRE
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //HANDLE
        //tbGendre.text = arrayGendre[row]
        //tbGendre.textColor = UIColor().hex("582FC0")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
