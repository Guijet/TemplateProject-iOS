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
    
    let btnNext = UIButton()
    
    var arrayCountries:[String]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = UIColor().hex("E6E1F1")
       
        setUpPickerCountry()
        setUpViewCountry()
        
        loadRegister2UI()
        
        // Do any additional setup after loading the view.
    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
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
        
        //city text box
        tbCity.frame = CGRect(x: rw(82), y: rh(267), width: rw(212.28), height: rh(28))
        tbCity.placeholder = "City"
        tbCity.textAlignment = .center
        tbCity.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbCity.autocapitalizationType = .none
        tbCity.textColor = UIColor().hex("582FC0")
        self.view.createHR(x: tbCity.frame.minX, y: tbCity.frame.maxY + rh(1), width: tbCity.frame.width, color: UIColor().hex("B8A6E4"))
        
        self.view.addSubview(tbCity)
        
        //next button
        btnNext.backgroundColor = UIColor().hex("#582FC0")
        btnNext.frame = CGRect(x: rw(77), y: rh(578), width: rw(222), height: rh(47))
        btnNext.layer.cornerRadius = rw(4)
        btnNext.setTitle("Next", for: .normal)
        btnNext.titleLabel?.font = UIFont(name: "Lato-Regular", size: rw(15))
        btnNext.setTitleColor(UIColor().hex("#FFFFFF"), for: .normal)
        
        self.view.addSubview(btnNext)
        
        btnNext.addTarget(self, action: #selector(toFinalRegisterPage(sender:)), for: .touchUpInside)
    }
    
    @objc func toFinalRegisterPage(sender:UIButton){
        if tbCity.text!.isEmpty || tbCountry.text!.isEmpty {
            Utility().alert(message: "Fill all information fields", title: "Incomplete information", control: self)
        } else {
            performSegue(withIdentifier: "toFinalRegisterPage", sender: nil)
        }
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toFinalRegisterPage" {
            (segue.destination as! VCFinalRegister).firstName = tbFirstName.text!
            (segue.destination as! VCFinalRegister).lastName = tbLastName.text!
            (segue.destination as! VCFinalRegister).email = tbEmail.text!
            (segue.destination as! VCFinalRegister).gendre = tbGendre.text!
            (segue.destination as! VCFinalRegister).birthDate = tbBirthDate.text!
            (segue.destination as! VCFinalRegister).isPicked = isPicked
            if isPicked {
                (segue.destination as! VCRegister2).profileImage = imvProfile.image!
            }
        }
    }
 */
    
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
}
