//
//  PageAnimations.swift
//  Template Project iOS
//
//  Created by Artifex on 2018-05-09.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

extension UIView {
    func closeMenu(control:UIViewController){
        control.view!.isUserInteractionEnabled = false
        control.navigationController?.navigationBar.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
            self.center.x -= control.view!.frame.width
        }, completion: { _ in
            control.view!.isUserInteractionEnabled = true
            control.navigationController?.navigationBar.isUserInteractionEnabled = true
        })
    }
    
    func openMenu(control:UIViewController){
        UIApplication.shared.keyWindow?.endEditing(true)
        control.view!.isUserInteractionEnabled = false
        control.navigationController?.navigationBar.isUserInteractionEnabled = false
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseIn, animations: {
            self.center.x += control.view!.frame.width
        }, completion: { _ in
            control.view!.isUserInteractionEnabled = true
            control.navigationController?.navigationBar.isUserInteractionEnabled = false
        })
    }
}

