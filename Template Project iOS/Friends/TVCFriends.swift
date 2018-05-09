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

class TVCFriends: UIViewController {

    // Le array friends sera rempli par une request
    let friends = [Friend(name: "Ben Charbonneau", imageURL: "instagram", id: 1), Friend(name: "Phil Dupras", imageURL: "Facebook", id: 2), Friend(name: "Guillaume Jette", imageURL: "instagram", id: 3)]
    let cellID = "friend"
    
    var listCell = [TVCellFriend]()
    
    var menuView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuView = CustomMenuView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height), control: self)
        self.view.addSubview(self.menuView)
        
        menuView.closeMenu(control: self)
        
        /*
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TVCellFriend.self, forCellReuseIdentifier: cellID)
        self.tableView.tableFooterView = UIView()
 */
        self.navigationItem.rightBarButtonItem?.target = self
        self.navigationItem.rightBarButtonItem?.action = #selector(navBtnAction)
    }
    
    @objc func navBtnAction(){
        menuView.openMenu(control: self)
    }
    
    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    */
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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

