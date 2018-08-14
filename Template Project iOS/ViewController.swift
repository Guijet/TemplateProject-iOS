//
//  ViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-17.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapped))
        self.view.addGestureRecognizer(tap)
    }
    
    @objc func tapped() {
        let vc = SwipePageController(imagesArray: [UIImage(named: "close-button")!.resizeImageWith(newSize: CGSize(width: rw(100), height: rh(75))), UIImage(named: "download-symbol")!.resizeImageWith(newSize: CGSize(width: rw(75), height: rh(100))), UIImage(named: "close-button")!.resizeImageWith(newSize: CGSize(width: rw(50), height: rh(50)))], firstIndex: 1)
        
        self.present(vc, animated: false, completion: nil)
    }
}

