//
//  VCMenu.swift
//  Template Project iOS
//
//  Created by Artifex-Mac on 2018-05-07.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class VCMenu: UIViewController, CustomMenuViewDelegate {
    
    
    var name:String!
    var image:UIImage!
    /*
    let imvProfile = UIImageView()
    let lblName = UILabel()
    let ivBackground = UIImageView()
    let ivSide = UIImageView()
     */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpMenuView()
        self.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    func selectedIndexChanged(_ selectedIndex: Int) {
        // TODO : 
        print("index tab : \(selectedIndex)")
        switch selectedIndex {
        case 1:
            print("To page Meet Me")
        case 2:
            print("To page Create an Event")
        case 3:
            print("To page Chat")
        case 4:
            print("To page Profile")
        case 5:
            print("To page Friends")
        case 6:
            print("To page Settings")
        default:
            break
        }
    }
    
    func setUpMenuView() {
        let menuView = CustomMenuView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        menuView.delegate = self
        self.view.addSubview(menuView)
    }

}
