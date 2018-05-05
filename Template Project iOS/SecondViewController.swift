//
//  SecondViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2018-05-05.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var receivedText:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Mon titre"
        setUpLabel()
        getServerItemsTest()
    }
    
    func setUpLabel(){
        let lblTest = UILabel()
        lblTest.createLabel(x: rw(100), y: rw(200), width: rw(200), height: rh(50), textColor: UIColor.red, fontName: "Lato-Regular", fontSize: rw(15), textAignment: .center, text: receivedText)
        self.view.addSubview(lblTest)
    }
    
    
    func getServerItemsTest(){
        let url = "https://api.influenceme-app.com/influencer/offers"
        let response = Utility().getJson(url: url, method: "GET", needToken:true)
        if(!response.getIsError()){
            let data = response.getDict()
        }
        
        
    }
}
