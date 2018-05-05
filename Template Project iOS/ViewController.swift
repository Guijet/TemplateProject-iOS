//
//  ViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-17.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    let tb = UITextField()
    var isKeyboardActive:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = .yellow
        
        //Opaque Bar Layout starting at the end of nav bar
        
        self.navigationController?.navigationBar.isTranslucent = false
        self.extendedLayoutIncludesOpaqueBars = false
        
//        let button = UIButton()
//        button.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
//        button.backgroundColor = .red
//        self.view.addSubview(button)
        
        setUpTextField()
    }

    
    func setUpTextField(){
        //tb.frame = CGRect(x: rw(75), y: rh(75), width: rw(100), height: rh(100))
        //tb.delegate = self
        
        tb.frame = CGRect(x: 0, y: 0, width: rw(300), height: rh(50))
        tb.center = CGPoint(x: self.view.center.x, y: self.view.center.y - rh(100))
        //tb.backgroundColor = .red
        tb.placeholder = "Ysfgd"
        tb.setUpPlaceholder(color: UIColor.black, fontName: "Lato-Regular", fontSize: rw(15))
        tb.returnKeyType = .done
        tb.font = UIFont(name: "Lato-Regular", size: rw(17))
        
        self.view.addSubview(tb)
        
        self.view.createHR(x: tb.frame.minX, y: tb.frame.maxY + rh(3), width: tb.frame.width, color: UIColor.black)
        
        let btnNext = UIButton()
        btnNext.backgroundColor = UIColor.blue
        btnNext.frame = CGRect(x: 0, y: tb.frame.maxY + rh(25), width: rw(30), height: rh(30))
        btnNext.center.x = self.view.center.x
        btnNext.setImage(UIImage(named:"instagram"), for: .normal)
        btnNext.tag = 5
        btnNext.layer.cornerRadius = btnNext.frame.width/2
        btnNext.imageEdgeInsets = UIEdgeInsets(top: 7, left: 7, bottom: 7, right: 7)
        btnNext.addTarget(self, action: #selector(toNextPage(sender:)), for: .touchUpInside)
        //btnNext.layer.borderColor = UIColor.black.cgColor
        //btnNext.layer.borderWidth = 1
        self.view.addSubview(btnNext)
        
        
        let tapGesturesRegognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing(_:)))
        self.view.addGestureRecognizer(tapGesturesRegognizer)
    }
    
    @objc func toNextPage(sender:UIButton){
        if(!tb.text!.isEmpty){
            performSegue(withIdentifier: "toSecondPage", sender: nil)
        }
        else{
            Utility().alert(message: "You need to fill all fileds.", title: "Message", control: self)
        }
    }
    
    //FORCE QUIT KEYBOARD
    @objc func endEditing(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    
    //RETURN PRESSED
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


    //CALL ANIMATION UP ON KEYBOARD END EDITING
    func textFieldDidEndEditing(_ textField: UITextField){
        if(isKeyboardActive){
            animateDown()
            isKeyboardActive = false
        }
    }
    
    //CALL ANIMATION UP ON KEYBOARD BEGIN EDITING
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if(!isKeyboardActive){
            animateUp()
            isKeyboardActive = true
        }
    }
    
    //BEGIN ANIMATION UP
    func animateUp(){
        //DISABLE VIEW FOR DOUBLE TAP
        self.view.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
            //MOVE WITH DELAY
            self.tb.center.y -= self.rh(200)
        }, completion: { _ in
            //REENABLED VIEW
            self.view.isUserInteractionEnabled = true
        })
    }
    
    func animateDown(){
        //DISABLE VIEW FOR DOUBLE TAP
        self.view.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseInOut, animations: {
            //MOVE WITH DELAY
            self.tb.center.y += self.rh(200)
        }, completion: { _ in
            //REENABLED VIEW
            self.view.isUserInteractionEnabled = true
        })
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "toSecondPage"){
            (segue.destination as! SecondViewController).receivedText = tb.text!
        }
    }
    
}

