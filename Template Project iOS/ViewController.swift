//
//  ViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-17.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var imvImage = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        imvImage.frame = CGRect(x: 0, y: 0, width: rw(75), height: rw(75))
//        imvImage.center = CGPoint(x: self.view.center.x, y: self.view.center.y)
        imvImage.layer.cornerRadius = rw(20)
        imvImage.layer.masksToBounds = true
        imvImage.image = UIImage(named: "close-button")
        imvImage.backgroundColor = .clear
        imvImage.tintColor = .black
        imvImage.contentMode = .scaleAspectFit
        imvImage.isUserInteractionEnabled = true
        self.view.addSubview(imvImage)
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        imvImage.addGestureRecognizer(tap)
    }
    
    @objc func tapped() {
        let vc = SwipePageController(imagesArray: [imvImage.image!, UIImage(named: "aws-big-logo")!], firstIndex: 0, firstImageView: imvImage)
        
        self.presentShowcase(showcase: vc, imageView: imvImage)
    }
}

