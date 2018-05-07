//
//  VCRegister.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit
import Photos

class VCRegister: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource {
    
    var isPicked = false

    let arrayGendre:[String] = ["Male", "Female", "Other"]
    
    let imvProfile = UIImageView()
    let btnChooseImage = UIButton()
    
    let tbFirstName = UITextField()
    let tbLastName = UITextField()
    let tbEmail = UITextField()
    
    let imagePicker = UIImagePickerController()
    
    let pickerView = UIPickerView()
    let tbGendre = UITextField()
    
    let tbBirthDate = UITextField()
    
    let btnNext = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = UIColor().hex("E6E1F1")
        
        
        setUpView()
        setUpPicker()
        setUpViewBirthDate()
        
        imagePicker.delegate = self
        
        loadRegisterUI()
    }
    
    func setUpPicker(){
        pickerView.delegate = self
        pickerView.dataSource = self
        tbGendre.delegate = self
        tbGendre.inputView = pickerView
        tbGendre.addCustomToolBar(target: self, selector: #selector(endEditing))
    }
    
    @objc func endEditing(){
        self.view.endEditing(true)
    }
    
    func setUpView(){
        tbGendre.frame = CGRect(x: rw(82.37), y: rh(388), width: rw(212.28), height: rh(28))
        tbGendre.placeholder = "Gendre"
        tbGendre.textAlignment = .center
        tbGendre.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbGendre.center.x = self.view.center.x
        tbGendre.autocapitalizationType = .none
        
        self.view.addSubview(tbGendre)
        
        self.view.createHR(x: tbGendre.frame.minX, y: tbGendre.frame.maxY + rh(1), width: tbGendre.frame.width, color: UIColor().hex("B8A6E4"))
    }
    
    func setUpViewBirthDate() {
        tbBirthDate.frame = CGRect(x: rw(82.37), y: rh(428), width: rw(212.28), height: rh(28))
        tbBirthDate.placeholder = "Birth date"
        tbBirthDate.textAlignment = .center
        tbBirthDate.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbBirthDate.center.x = self.view.center.x
        tbBirthDate.autocapitalizationType = .none
        
        self.view.addSubview(tbBirthDate)
        
        self.view.createHR(x: tbBirthDate.frame.minX, y: tbBirthDate.frame.maxY + rh(1), width: tbBirthDate.frame.width, color: UIColor().hex("B8A6E4"))
        
        tbBirthDate.addTarget(self, action: #selector(triggerDatePicker(sender:)), for: .editingDidBegin)
        
        tbBirthDate.addCustomToolBar(target: self, selector: #selector(endEditing))
    }
    
    @objc func triggerDatePicker(sender:UITextField) {
        let datePicker = UIDatePicker()
        
        datePicker.datePickerMode = .date
        
        sender.inputView = datePicker
        datePicker.addTarget(self, action: #selector(handleValueChange(sender:)), for: .valueChanged)
    }
    
    @objc func handleValueChange(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        tbBirthDate.text = dateFormatter.string(from: sender.date)
        tbBirthDate.textColor = UIColor().hex("582FC0")
    }
    
    func loadRegisterUI() {
        
        let imvBottom = UIImageView()
        
        self.view.backgroundColor = UIColor().hex("#E6E1F1")
        
        imvBottom.image = UIImage(named: "Combined Shape")
        imvBottom.frame = CGRect(x: rw(0), y: rh(503), width: rw(375), height: rh(164))
        
        imvProfile.image = UIImage(named: "Icon_Utilisateur")
        imvProfile.frame = CGRect(x: rw(123), y: rh(102), width: rw(130), height: rw(130))
        imvProfile.layer.cornerRadius = rw(65)
        imvProfile.layer.masksToBounds = true
        
        btnChooseImage.frame = CGRect(x: rw(212), y: rh(92), width: rw(43), height: rw(43))
        btnChooseImage.setImage(UIImage(named: "Camera"), for: .normal)
        btnChooseImage.layer.cornerRadius = rw(21.5)
        btnChooseImage.layer.masksToBounds = true
        btnChooseImage.addTarget(self, action: #selector(chooseImage), for: .touchUpInside)
        
        self.view.addSubview(imvBottom)
        self.view.addSubview(imvProfile)
        self.view.addSubview(btnChooseImage)
        
        tbFirstName.delegate = self

        //first name text field
        tbFirstName.frame = CGRect(x: rw(82.37), y: rh(268), width: rw(212.28), height: rh(28))
        tbFirstName.placeholder = "First name"
        tbFirstName.textAlignment = .center
        tbFirstName.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbFirstName.autocapitalizationType = .none
        tbFirstName.textColor = UIColor().hex("582FC0")
        
        self.view.addSubview(tbFirstName)
        
        self.view.createHR(x: tbFirstName.frame.minX, y: tbFirstName.frame.maxY + rh(1), width: tbFirstName.frame.width, color: UIColor().hex("B8A6E4"))
        
        tbLastName.delegate = self
        
        //last name text field
        tbLastName.frame = CGRect(x: rw(82.37), y: rh(308), width: rw(212.28), height: rh(28))
        tbLastName.placeholder = "Last name"
        tbLastName.textAlignment = .center
        tbLastName.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbLastName.autocapitalizationType = .none
        tbLastName.textColor = UIColor().hex("582FC0")
        
        self.view.addSubview(tbLastName)
        
        self.view.createHR(x: tbLastName.frame.minX, y: tbLastName.frame.maxY + rh(1), width: tbLastName.frame.width, color: UIColor().hex("B8A6E4"))
        
        tbEmail.delegate = self
        
        //email text field
        tbEmail.frame = CGRect(x: rw(82.37), y: rh(348), width: rw(212.28), height: rh(28))
        tbEmail.placeholder = "Email"
        tbEmail.textAlignment = .center
        tbEmail.setUpPlaceholder(color: UIColor().hex("582FC0"), fontName: "Lato-Regular", fontSize: rw(16))
        tbEmail.autocapitalizationType = .none
        tbEmail.textColor = UIColor().hex("582FC0")
        
        self.view.addSubview(tbEmail)
        
        self.view.createHR(x: tbEmail.frame.minX, y: tbEmail.frame.maxY + rh(1), width: tbEmail.frame.width, color: UIColor().hex("B8A6E4"))
        
        let tapGesturesRegognizer = UITapGestureRecognizer(target: self, action: #selector(endWriting(sender:)))
        self.view.addGestureRecognizer(tapGesturesRegognizer)
        
        //next button
        
        btnNext.backgroundColor = UIColor().hex("#582FC0")
        btnNext.frame = CGRect(x: rw(77), y: rh(578), width: rw(222), height: rh(47))
        btnNext.layer.cornerRadius = rw(4)
        btnNext.setTitle("Next", for: .normal)
        btnNext.titleLabel?.font = UIFont(name: "Lato-Regular", size: rw(15))
        btnNext.setTitleColor(UIColor().hex("#FFFFFF"), for: .normal)
        
        self.view.addSubview(btnNext)
        
        btnNext.addTarget(self, action: #selector(toLocationPage(sender:)), for: .touchUpInside)
        
    }
    
    @objc func toLocationPage(sender:UIButton){
        
        let requestEmailValidation = RequestLogin()
        /*
        if tbEmail.text!.isEmpty || tbLastName.text!.isEmpty || tbFirstName.text!.isEmpty {
            Utility().alert(message: "Fill all information fields", title: "Incomplete information", control: self)
        } else if !tbEmail.text!.isValidEmail() {
            Utility().alert(message: "Enter a valid email address", title: "Invalid email format", control: self)
        } else if !(requestEmailValidation.verifyEmail(email:tbEmail.text!).validConnexion!) {
            Utility().alert(message: "This email address is already taken", title: "Invalid email address", control: self)
        } else {
        */
            performSegue(withIdentifier: "toRegister2", sender: nil)
        //}
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toRegister2" {
            (segue.destination as! VCRegister2).firstName = tbFirstName.text!
            (segue.destination as! VCRegister2).lastName = tbLastName.text!
            (segue.destination as! VCRegister2).email = tbEmail.text!
            (segue.destination as! VCRegister2).gendre = tbGendre.text!
            (segue.destination as! VCRegister2).birthDate = tbBirthDate.text!
            (segue.destination as! VCRegister2).isPicked = isPicked
            if isPicked {
                (segue.destination as! VCRegister2).profileImage = imvProfile.image!
            }
        }
    }
    */
 
    @objc func endWriting(sender:UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func chooseImage(){
        Utility().alertWithChoice(message: "", title: "", control: self, actionTitle1: "Take a picture", actionTitle2: "Choose a picture from camera roll", action1: takePicture, action2: loadPicture, style: .actionSheet)
    }
    
    func takePicture(){
        AVCaptureDevice.requestAccess(for: AVMediaType.video) { response in
            if response {
                self.imagePicker.allowsEditing = false
                self.imagePicker.sourceType = .camera
                self.imagePicker.cameraDevice = .front
                self.imagePicker.allowsEditing = false
                self.imagePicker.cameraCaptureMode = .photo
                self.imagePicker.showsCameraControls = true
                self.present(self.imagePicker, animated: true, completion: nil)
            } else {}
        }
    }
    
    func loadPicture(){
        //Photos
        let photos = PHPhotoLibrary.authorizationStatus()
        if photos == .notDetermined {
            PHPhotoLibrary.requestAuthorization({status in
                if status == .authorized{
                    self.imagePicker.sourceType = .photoLibrary
                    self.imagePicker.allowsEditing = true
                    self.present(self.imagePicker, animated: true, completion: nil)
                } else {}
            })
        }
        else if(photos == .authorized){
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        else if(photos == .denied){
            Utility().alert(message: "Can't access camera roll. Please allow acces in parameters", title: "Message", control: self)
        }
    }
    
    func addImageToView(image:UIImage){
        imvProfile.image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.isPicked = true
            addImageToView(image: pickedImage)
            //ACTION LORSQUE L'IMAGE EST CHOISI
        }
        dismiss(animated: true) {
            return
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == tbGendre {
            if (textField.text?.isEmpty)! {
                textField.text = arrayGendre[0]
                textField.textColor = UIColor().hex("582FC0")
            }
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arrayGendre[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arrayGendre.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //HANDLE
        tbGendre.text = arrayGendre[row]
        tbGendre.textColor = UIColor().hex("582FC0")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
}
