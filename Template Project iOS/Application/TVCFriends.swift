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

class TVCFriends: UITableViewController {
    
    // Le array friends sera rempli par une request
    let friends = [Friend(name: "Ben Charbonneau", imageURL: "instagram", id: 1), Friend(name: "Phil Dupras", imageURL: "Facebook", id: 2), Friend(name: "Guillaume Jette", imageURL: "instagram", id: 3)]
    let cellID = "friend"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(TVCellFriend.self, forCellReuseIdentifier: cellID)
        self.tableView.tableFooterView = UIView()
        
    }
    
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
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

