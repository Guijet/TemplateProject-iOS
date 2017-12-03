//
//  TextFieldsTools.swift
//  ArtifexApp
//
//  Created by Guillaume Jette on 2017-12-02.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

extension UITextField{
    func setUpPlaceholder(color:UIColor,fontName:String,fontSize:CGFloat){
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor : color,NSAttributedStringKey.font : UIFont(name: fontName, size: fontSize)!])
    }
}
