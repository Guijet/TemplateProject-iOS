//
//  MainNC.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class MainNC: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        let backItem = UIBarButtonItem()
        
        backItem.title = ""
        self.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationBar.barTintColor = UIColor().hex("582FC0")
        
        for x in self.viewControllers {
            x.navigationItem.backBarButtonItem = backItem
        }
    }
    
    func hideBack() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
}
