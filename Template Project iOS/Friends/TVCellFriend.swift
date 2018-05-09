//
//  TVCellFriend.swift
//  Template Project iOS
//
//  Created by Artifex-Mac on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class TVCellFriend: BaseCell {
    
    var lblName:UILabel!
    var ivImage:UIImageView!
    
    override func setUpView() {
        // height = 100
        
        let width = UIScreen.main.bounds.width
        lblName = UILabel()
        ivImage = UIImageView()
        
        lblName.frame = CGRect(x: width * 0.35, y: 0, width: width - (width * 0.3), height: 100)
        lblName.center.y = 50
        lblName.textColor = .black
        self.addSubview(lblName)
        
        ivImage.frame = CGRect(x: width * 0.1, y: 0, width: 70, height: 70)
        ivImage.center.y = 50
        ivImage.layer.cornerRadius = 35
        ivImage.layer.masksToBounds = true
        self.addSubview(ivImage)
        
        self.createHR(x: 0, y: 100, width: UIScreen.main.bounds.width, color: UIColor().hex("582FC0"))
    }
    
}

