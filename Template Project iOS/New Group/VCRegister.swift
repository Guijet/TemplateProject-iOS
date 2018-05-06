//
//  VCRegister.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit
import Photos

class VCRegister: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let imvProfile = UIImageView()
    
    let btnChooseImage = UIButton()
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = false
        self.view.backgroundColor = UIColor().hex("E6E1F1")
        
        loadRegisterUI()
        
        imagePicker.delegate = self
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
    
    
    

    
    //underline: self.view. ... hr
    
}
