//
//  CustomMenuView.swift
//  Template Project iOS
//
//  Created by Artifex-Mac on 2018-05-07.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

protocol CustomMenuViewDelegate: class {
    func selectedIndexChanged(_ selectedIndex:Int)
}


class CustomMenuView: UIView {
    
    weak var delegate: CustomMenuViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
