//
//  LineGraph.swift
//  InfluenceMe
//
//  Created by Guillaume Jette on 2018-03-03.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class LineGraph: UIView {

    private var control:UIViewController!
    private var data:[Float]!
    private var MaxValue:CGFloat!
    
    let shapeLayer = CAShapeLayer()
    let maskLayer = CAShapeLayer()
    
    init(frame:CGRect,control:UIViewController,data:[Float]) {
        super.init(frame:frame)
        self.control = control
        self.data = data
        self.MaxValue = CGFloat(ceil(Double(data.max()!)))
        print(MaxValue)
        SetUpGraph(data:data)
    }

    override func draw(_ rect: CGRect) {
        JoinPointsWithLines()
        //RemovePoints()
    }
    
    func SetUpGraph(data:[Float]){
        SetPointsOnGraph(data:data)
    }
    
    func SetPointsOnGraph(data:[Float]){
        if(data.count > 0){
            
            let spacing = GetSpacing(data:data)
            var toX:CGFloat = self.control.rw(4)
            var index:Int = 0
            
            for x in data{
                let point = UIView()
                point.frame = CGRect(x: 0, y: 0, width: self.control.rw(8), height: self.control.rw(8))
                point.accessibilityIdentifier = "point\(index)"
                point.layer.cornerRadius = self.control.rw(4)
                point.layer.borderWidth = 1
                point.layer.borderColor = UIColor().hex("#188DC2").cgColor
                point.backgroundColor = UIColor.white
                
                if(data.last == x){
                    toX -= control.rw(8)
                }
                
                point.center.x = toX
                point.center.y = GetPointYValue(value:x)
                
                self.addSubview(point)
                
                index += 1
                toX += spacing
            }
        }
        else{
            //NO DATA
        }
    }
    
    func GetSpacing(data:[Float])->CGFloat{
        return self.frame.width/CGFloat(data.count - 1)
    }
    
    func GetPointYValue(value:Float)->CGFloat{
        return ((self.frame.height + self.control.rw(4)) - (CGFloat(value) * self.frame.height) / MaxValue)
    }
    
    func JoinPointsWithLines(){
        var index = 0
        let arrPoints = GetPointsArray()
        if(arrPoints.count > 0){
            repeat{
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn, animations: {
                    self.drawLine(p1:CGPoint(x:arrPoints[index].center.x,y:arrPoints[index].center.y),p2:CGPoint(x:arrPoints[index + 1].center.x,y:arrPoints[index + 1].center.y))
                }, completion: nil)
                
                index += 1
            }while(index != arrPoints.count - 1)
        }
    }
    
    func GetWidthBeetweenTwoPoints(p1:CGPoint,p2:CGPoint)->CGFloat{
        return sqrt((pow((p2.x - p1.x),2)) + (pow((p2.y - p1.y),2)))
    }
    
    func drawLine(p1:CGPoint,p2:CGPoint){
        

        
        let aPath = UIBezierPath()

        aPath.lineWidth = 2.5
        aPath.move(to: p1)
        aPath.addLine(to: p2)
        aPath.close()
        UIColor().hex("#188DC2").set()
        aPath.stroke()
        aPath.fill()
        

    }
    

    
    func GetPointsArray()->[UIView]{
        var arrPointView = [UIView]()
        if(self.subviews.count > 0){
            for x in self.subviews{
                if(x.accessibilityIdentifier?.contains("point"))!{
                    arrPointView.append(x)
                }
            }
        }
        return arrPointView
    }
    
    func RemovePoints(){
        for x in self.subviews{
            if(x.accessibilityIdentifier?.contains("point"))!{
                x.removeFromSuperview()
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
