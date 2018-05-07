//
//  VCRegister2.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class VCRegister2: UIViewController, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {

    var isPicked:Bool!
    var firstName:String!
    var lastName:String!
    var email:String!
    var gendre:String!
    var birthDate:String!
    var profileImage:UIImage?
    
    let imvProfile = UIImageView()
    let profileView = UIView()
    
    let pickerViewCity = UIPickerView()
    let tbCity = UITextField()
    
    let pickerViewCountry = UIPickerView()
    let tbCountry = UITextField()
    
    let tbPhone = UITextField()
    
    let btnNext = UIButton()
    
    var arrayCountries:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = UIColor().hex("E6E1F1")
       
        setUpPickerCountry()
        setUpViewCountry()
        
        tbPhone.delegate = self
        
        loadRegister2UI()
        
        // Do any additional setup after loading the view.
    }
    
    func setUpPickerCountry(){
        pickerViewCountry.delegate = self
        pickerViewCountry.dataSource = self
        tbCountry.inputView = pickerViewCountry
        tbCountry.addCustomToolBar(target: self, selector: #selector(endEditing))
        
        arrayCountries = LocalHelper.shared.getCountriesList().sorted(by:{$0 < $1})
    }
    
    func setUpViewCountry(){
        tbCountry.delegate = self
        
        tbCountry.frame = CGRect(x: rw(82), y: rh(307), width: rw(212.28), height: rh(28))
        tbCountry.placeholder = "Country"
        tbCountry.textAlignment = .center
        tbCountry.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbCountry.autocapitalizationType = .none
        tbCountry.textColor = UIColor().hex("582FC0")
        self.view.createHR(x: tbCountry.frame.minX, y: tbCountry.frame.maxY + rh(1), width: tbCountry.frame.width, color: UIColor().hex("B8A6E4"))
        
        self.view.addSubview(tbCountry)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if !isPicked {
            imvProfile.image = profileView.getScreenShot()
            self.view.addSubview(imvProfile)
        }
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
        
        if isPicked {
            imvProfile.image = profileImage
            self.view.addSubview(imvProfile)
        } else {
            
            profileView.frame = CGRect(x: rw(122), y: rh(102), width: rw(130), height: rw(130))
            profileView.backgroundColor = UIColor().hex("582FC0")
            
            let lblInitials = UILabel()
            lblInitials.font = UIFont(name: "Lato-Regular", size: rw(72))
            lblInitials.textColor = .white
            lblInitials.textAlignment = .center
            lblInitials.frame = CGRect(x: rw(0), y: rh(0), width: rw(130), height: rw(130))
            lblInitials.center.x = profileView.frame.width/2
            lblInitials.center.y = profileView.frame.height/2
            
            var letter1:String!
            var letter2:String!
            
            letter1 = String(firstName.substring(from: 0, to: 1)).uppercased()
            letter2 = String(lastName.substring(from: 0, to: 1)).uppercased()
            lblInitials.text = "\(letter1!)\(letter2!)"
            lblInitials.adjustsFontSizeToFitWidth = true
            
            profileView.addSubview(lblInitials)
        }
        
        
        //city text box
        tbCity.frame = CGRect(x: rw(82), y: rh(267), width: rw(212.28), height: rh(28))
        tbCity.placeholder = "City"
        tbCity.textAlignment = .center
        tbCity.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbCity.autocapitalizationType = .none
        tbCity.textColor = UIColor().hex("582FC0")
        self.view.createHR(x: tbCity.frame.minX, y: tbCity.frame.maxY + rh(1), width: tbCity.frame.width, color: UIColor().hex("B8A6E4"))
        
        self.view.addSubview(tbCity)
        
        //Phone number text box
        tbPhone.keyboardType = UIKeyboardType.numberPad
        tbPhone.frame = CGRect(x: rw(82), y: rh(347), width: rw(212.28), height: rh(28))
        tbPhone.placeholder = "Phone number"
        tbPhone.textAlignment = .center
        tbPhone.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbPhone.autocapitalizationType = .none
        tbPhone.textColor = UIColor().hex("582FC0")
        self.view.createHR(x: tbPhone.frame.minX, y: tbPhone.frame.maxY + rh(1), width: tbPhone.frame.width, color: UIColor().hex("B8A6E4"))
        tbPhone.addCustomToolBar(target: self, selector: #selector(endEditing))

        self.view.addSubview(tbPhone)
        
        //next button
        btnNext.backgroundColor = UIColor().hex("#582FC0")
        btnNext.frame = CGRect(x: rw(77), y: rh(578), width: rw(222), height: rh(47))
        btnNext.layer.cornerRadius = rw(4)
        btnNext.setTitle("Next", for: .normal)
        btnNext.titleLabel?.font = UIFont(name: "Lato-Regular", size: rw(15))
        btnNext.setTitleColor(UIColor().hex("#FFFFFF"), for: .normal)
        
        self.view.addSubview(btnNext)
        
        btnNext.addTarget(self, action: #selector(toFinalRegisterPage(sender:)), for: .touchUpInside)
        
        let tapGesturesRegognizer = UITapGestureRecognizer(target: self, action: #selector(endWriting(sender:)))
        self.view.addGestureRecognizer(tapGesturesRegognizer)
    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    @objc func endWriting(sender:UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @objc func toFinalRegisterPage(sender:UIButton){
        
        if tbCity.text!.isEmpty || tbCountry.text!.isEmpty || tbPhone.text!.isEmpty {
            Utility().alert(message: "Fill all information fields", title: "Incomplete information", control: self)
        } else if tbCity.text!.containerNumber() {
            Utility().alert(message: "City names can't contain numbers", title: "Invalid city name", control: self)
        } else if !tbPhone.text!.verifyLenght(min: 10, max: 10){
            Utility().alert(message: "Invalid phone number", title: "Invalid information", control: self)
        } else {
            performSegue(withIdentifier: "toFinalRegisterPage", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinalRegisterPage" {
            (segue.destination as! VCFinalRegister).firstName = firstName
            (segue.destination as! VCFinalRegister).lastName = lastName
            (segue.destination as! VCFinalRegister).email = email
            (segue.destination as! VCFinalRegister).gendre = gendre
            (segue.destination as! VCFinalRegister).birthDate = birthDate
            (segue.destination as! VCFinalRegister).profileImage = imvProfile.image!
            (segue.destination as! VCFinalRegister).city = tbCity.text!
            (segue.destination as! VCFinalRegister).country = tbCountry.text!
            (segue.destination as! VCFinalRegister).phone = tbPhone.text!
        }
    }
 
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return arrayCountries[row] //TEMPORAIRE
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayCountries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //HANDLE
        tbCountry.text = arrayCountries[row]
        tbCountry.textColor = UIColor().hex("582FC0")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tbCountry {
            if (textField.text?.isEmpty)! {
                textField.text = arrayCountries[0]
                textField.textColor = UIColor().hex("582FC0")
            }
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
