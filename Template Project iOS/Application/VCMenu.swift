//
//  VCMenu.swift
//  Template Project iOS
//
//  Created by Artifex-Mac on 2018-05-07.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class VCMenu: UIViewController {
    
    var name:String!
    var image:UIImage!

    let imvProfile = UIImageView()
    let lblName = UILabel()
    let ivBackground = UIImageView()
    let ivSide = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBackground()
        setUpBackgroundSide()
        setUpImage()
        setUpLabelName()
        
        

        // Do any additional setup after loading the view.
    }
    
    func setUpImage()  {
        imvProfile.image = image
        imvProfile.backgroundColor = .white
        imvProfile.frame = CGRect(x: 0, y: rh(102), width: rw(80), height: rw(80))
        imvProfile.center.x = self.view.center.x
        imvProfile.layer.cornerRadius = rw(80/2)
        imvProfile.layer.masksToBounds = true
        self.view.addSubview(imvProfile)
    }
    
    func setUpLabelName() {
        lblName.frame = CGRect(x: 0, y: rh(192), width: UIScreen.main.bounds.width, height: rh(21))
        lblName.text = name
        lblName.textColor = UIColor().hex("582FC0")
        lblName.textAlignment = .center
        lblName.font = UIFont(name: "Lato-Regular", size: rh(21))
        self.view.addSubview(lblName)
    }
    
    func setUpBackground() {
        ivBackground.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        ivBackground.image = UIImage(named: "Fond degrade")
        self.view.addSubview(ivBackground)
    }
    
    func setUpBackgroundSide() {
        ivSide.frame = CGRect(x: rw(278), y: 0, width: rw(100), height: UIScreen.main.bounds.height)
        ivSide.image = UIImage(named: "Side shape")
        self.view.addSubview(ivSide)
    }

}
