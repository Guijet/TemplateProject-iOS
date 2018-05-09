//
//  AppNC.swift
//  Template Project iOS
//
//  Created by Artifex-Mac on 2018-05-07.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class AppNC: UINavigationController {

    
    override func viewWillLayoutSubviews() {
        let btnNav = setBarButton()
        
        self.navigationBar.tintColor = .white
        self.extendedLayoutIncludesOpaqueBars = true
        self.navigationBar.barTintColor = UIColor().hex("582FC0")
        
        for x in self.viewControllers {
            x.navigationItem.rightBarButtonItem = btnNav
        }
    }
    
    func hideBack() {
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    func setBarButton() -> UIBarButtonItem {
        let btnNav = UIBarButtonItem()
        
        btnNav.image = UIImage(named: "Menu Icone")
        return btnNav
    }
    
    func setBackButton() -> UIBarButtonItem{
        let backItem = UIBarButtonItem()
        
        backItem.title = ""
        
        return backItem
    }
}
