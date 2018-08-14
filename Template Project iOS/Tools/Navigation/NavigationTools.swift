//
//  NavigationTools.swift
//  InfluenceMe
//
//  Created by Guillaume Jette on 2018-01-22.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

extension UIApplication{
    
    //CHANGE STATUS BAR BACKGROUND COLOR
    //
    //
    func setStatusBarBackgroundColor(color: UIColor) {
        guard let statusBar = self.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        statusBar.backgroundColor = color
    }
    
    //DEFAULT VALUE OF APP STATUS BAR
    //
    //
    func setStatusBarBlack(){
        let statusBar: UIView = self.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.tintColor = UIColor().hex("000000")
            statusBar.backgroundColor = UIColor.clear
        }
        self.statusBarStyle = .default
    }
    
    func setStatusBarWhite(){
        let statusBar: UIView = self.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.tintColor = UIColor().hex("FFFFFF")
            statusBar.backgroundColor = UIColor.clear
        }
        self.statusBarStyle = .lightContent
    }
    
    func setStatusBarDegrade(){
        let statusBar: UIView = self.value(forKey: "statusBar") as! UIView
        if statusBar.responds(to:#selector(setter: UIView.backgroundColor)) {
            statusBar.tintColor = UIColor().hex("FFFFFF")
            statusBar.setGradientBackground(color1: UIColor().hex("C628FF").cgColor, color2: UIColor().hex("6F1DFF").cgColor)
            //statusBar.tintColor = UIColor().hex("FFFFFF")
        }
        self.statusBarStyle = .lightContent
    }
}


extension UINavigationController{
    func setTranslusentBar(){
        self.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationBar.shadowImage = UIImage()
        self.navigationBar.isTranslucent = true
    }
    
    func setBlueBarTop(){
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = UIColor().hex("#188DC2")
        self.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
        self.navigationBar.setBackgroundImage(nil, for: UIBarMetrics.default)
        self.navigationBar.shadowImage = nil
    }
    
    func setDegradeBar(image:UIImage) {
        self.navigationBar.isTranslucent = true
        let resizedImage = image.resizeImageWith(newSize: navigationBar.frame.size)
        self.navigationBar.setBackgroundImage(resizedImage, for: UIBarMetrics.default)
    }
}
