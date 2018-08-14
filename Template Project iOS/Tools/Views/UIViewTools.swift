//
//  UIViewTools.swift
//  ArtifexApp
//
//  Created by Guillaume Jette on 2017-12-02.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

extension UIView{

    /// Flip view horizontally the view
    //
    //
    func flipX() {
        transform = CGAffineTransform(scaleX: -transform.a, y: transform.d)
    }
    
    /// Flip view vertically.
    //
    //
    func flipY() {
        transform = CGAffineTransform(scaleX: transform.a, y: -transform.d)
    }
    
    //Create shadows of the view
    //based on Sketch design
    //
    //
    func makeShadow(x:CGFloat,y:CGFloat,blur:CGFloat,cornerRadius:CGFloat,shadowColor:UIColor,shadowOpacity:Float,spread:CGFloat){
        
        let radius: CGFloat = self.frame.width / spread
        let shadowPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: (spread) * radius, height: self.frame.height))
        
        self.layer.cornerRadius = cornerRadius
        self.layer.shadowColor = shadowColor.cgColor
        self.layer.shadowOffset = CGSize(width: x, height: y)
        self.layer.shadowOpacity = shadowOpacity
        self.layer.shadowRadius = blur
        self.layer.masksToBounds =  false
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    //Create gradient color as background
    //based on tow colors from Sketch
    //Start points and end points can be changed
    //
    //
//    func setGradientBackground(color1:CGColor,color2:CGColor){
//        let gradient: CAGradientLayer = CAGradientLayer()
//        
//        gradient.colors = [color1, color2]
//        gradient.locations = [0.0 , 1.0]
//        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
//        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
//        self.layer.addSublayer(gradient)
//    }
    
    //Create gradient color as background
    //based on two colors from Sketch and a custom position
    //Start points and end points can be changed
    // By default, it's from left to right
    //
    func setGradientBackground(color1:CGColor,color2:CGColor, location1:NSNumber = 0.0, location2:NSNumber = 1.0, startPoint:CGPoint = CGPoint(x: 0.0, y: 1.0), endPoint:CGPoint = CGPoint(x: 1.0, y: 1.0)){
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [color1, color2]
        gradient.locations = [location1, location2]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    // Create a gradient color as a background
    // based on three colors and a custom position
    // startPoint, endPoints can be changed
    // By default, it's from left to right
    func setGradientBackground(color1:CGColor, color2:CGColor, color3:CGColor, location1:NSNumber = 0, location2:NSNumber = 0.5, location3:NSNumber = 1.0, startPoint:CGPoint = CGPoint(x: 0.0, y: 1.0), endPoint:CGPoint = CGPoint(x: 1.0, y: 1.0)) {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [color1, color2, color3]
        gradient.locations = [location1 , location2, location3]
        gradient.startPoint = startPoint
        gradient.endPoint = endPoint
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.bounds.width, height: self.bounds.height)
        self.layer.insertSublayer(gradient, at: 0)
    }
    
    func setGradientBgVertical(color1:CGColor,color2:CGColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [color1, color2]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 1.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: self.frame.height)
        self.layer.insertSublayer(gradient, at:0)
    }
    
    //ROUNDED CORNERS FOR CHOSEN SIDES
    //
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    //Create a dashed line patern
    //parameters in function can
    //be changed based on design
    //
    //
    func addDashedBorder(color:UIColor,lineWidth:CGFloat,linePattern:[NSNumber]) {
        let color = color
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = color.cgColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        shapeLayer.lineDashPattern = linePattern
        shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: shapeRect.width/2).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    //Create HR in View
    //
    //
    //
    func createHR(x: CGFloat,y: CGFloat, width: CGFloat,color: UIColor,isAlphaZero:Bool = false, height:CGFloat = 1) {
        let hr = UITextView()
        hr.accessibilityIdentifier = "HR"
        hr.isSelectable = false
        hr.isEditable = false
        hr.frame = CGRect(x: x, y: y, width: width, height: height)
        hr.backgroundColor = color
        hr.isUserInteractionEnabled = false
        if(isAlphaZero){
            hr.alpha = 0
        }
        self.addSubview(hr)
    }
    
    //Create vertical HR
    //
    //
    //
    func createVerticalHR(x: CGFloat,y: CGFloat, height: CGFloat,color: UIColor){
        let hr = UITextView()
        hr.isSelectable = false
        hr.isEditable = false
        hr.frame = CGRect(x: x, y: y, width: 1, height: height)
        hr.backgroundColor = color
        hr.isUserInteractionEnabled = false
        self.addSubview(hr)
    }
    
    //Ration Width value based on view size
    //
    //
    func rw(_ val: CGFloat) -> CGFloat {
        return val * (self.frame.width / 375)
    }
    
    //Ration Height value based on view size
    //
    //
    func rh(_ val: CGFloat) -> CGFloat {
        return val * (self.frame.height / 667)
    }
    

    //Create a new instance of a
    //view (a copy of it)
    //
    //
    func copyView<T: UIView>() -> T {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! T
    }
    
    //MARGIN UTILITY FOR iOS 11.0 ++
    //
    //
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.topAnchor
        } else {
            return self.topAnchor
        }
    }
    
    var safeLeftAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.leftAnchor
        }else {
            return self.leftAnchor
        }
    }
    
    var safeRightAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *){
            return self.safeAreaLayoutGuide.rightAnchor
        }else {
            return self.rightAnchor
        }
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return self.safeAreaLayoutGuide.bottomAnchor
        } else {
            return self.bottomAnchor
        }
    }
    
    
}
