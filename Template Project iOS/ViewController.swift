//
//  ViewController.swift
//  Template Project iOS
//
//  Created by Guillaume Jette on 2017-11-17.
//  Copyright © 2017 Guillaume Jette. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var graph:LineGraphView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        // Do any additional setup after loading the view, typically from a nib.
        graph = LineGraphView(frame: CGRect(x:10,y:100,width:self.view.frame.width - 20,height:150),dataX:[1,2,3,4] , dataY: [12,41,12,123], control: self)
        self.view.addSubview(graph)
    }

    override func viewDidAppear(_ animated: Bool) {
        graph.animateGraphIn()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

