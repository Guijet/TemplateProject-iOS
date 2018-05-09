//
//  TVCFriends.swift
//  Template Project iOS
//
//  Created by Artifex-Mac on 2018-05-06.
//  Copyright © 2018 Guillaume Jette. All rights reserved.
//

import UIKit

struct Friend {
    var name:String
    var imageURL:String
    var id:Int
    
    init(name:String, imageURL:String, id:Int) {
        self.name = name
        self.imageURL = imageURL
        self.id = id
    }
}

class TVCFriends: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Le array friends sera rempli par une request
    let friends = [Friend(name: "Ben Charbonneau", imageURL: "instagram", id: 1), Friend(name: "Phil Dupras", imageURL: "Facebook", id: 2), Friend(name: "Guillaume Jette", imageURL: "instagram", id: 3)]
    let cellID = "friend"
    
    var listCell = [TVCellFriend]()
    var tableView = UITableView()
    
    var menuView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        menuView = CustomMenuView(frame: CGRect(x: 0 - self.view.frame.width, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), control: self)
        self.view.addSubview(self.menuView)
        //menuView.closeMenu(control: self)
        self.navigationItem.rightBarButtonItem?.target = self
        self.navigationItem.rightBarButtonItem?.action = #selector(navBtnAction)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    @objc func navBtnAction(){
        menuView.openMenu(control: self)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TVCellFriend
        
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        
        cell.lblName.text = friends[indexPath.row].name
        cell.ivImage.image = UIImage(named: friends[indexPath.row].imageURL)
        cell.tag = friends[indexPath.row].id
        listCell.append(cell)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func setUpTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TVCellFriend.self, forCellReuseIdentifier: cellID)
        tableView.tableFooterView = UIView()
        tableView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.view.addSubview(tableView)
    }
    
    /*
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toOneFriend", sender: listCell[indexPath.row])
    }
 
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let sender = sender as! TVCellFriend
        if segue.identifier == "toOneFriend" {
            (segue.destination as! VCMenu).name = sender.lblName.text!
            (segue.destination as! VCMenu).image = sender.ivImage.image!
        }
    }
 */

}

