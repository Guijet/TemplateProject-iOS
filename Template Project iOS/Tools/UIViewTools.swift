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
    
    func addDashedBorder2(strokeColor: UIColor, lineWidth: CGFloat) {
        self.layoutIfNeeded()
        let strokeColor = strokeColor.cgColor
        
        let shapeLayer:CAShapeLayer = CAShapeLayer()
        let frameSize = self.frame.size
        let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
        
        shapeLayer.bounds = shapeRect
        shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = strokeColor
        shapeLayer.lineWidth = lineWidth
        shapeLayer.lineJoin = kCALineJoinRound
        
        shapeLayer.lineDashPattern = [5,5] // adjust to your liking
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: shapeRect.width, height: shapeRect.height), cornerRadius: self.layer.cornerRadius).cgPath
        
        self.layer.addSublayer(shapeLayer)
    }
    
    //Create gradient color as background
    //based on tow colors from Sketch
    //Start points and end points can be changed
    //
    //
    func setGradientBackground(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        
        gradient.colors = [color1, color2]
        gradient.locations = [0.0 , 1.0]
        gradient.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradient.endPoint = CGPoint(x: 1.0, y: 1.0)
        gradient.frame = CGRect(x: 0.0, y: 0.0, width: self.frame.size.width, height: self.frame.size.height)
        self.layer.insertSublayer(gradient, at: 0)
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
    func createHR(x: CGFloat,y: CGFloat, width: CGFloat,color: UIColor) {
        let hr = UITextView()
        hr.isSelectable = false
        hr.isEditable = false
        hr.frame = CGRect(x: x, y: y, width: width, height: 1)
        hr.backgroundColor = color
        hr.isUserInteractionEnabled = false
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
}
