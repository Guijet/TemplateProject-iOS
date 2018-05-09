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
    
    var selectedIndex = 1
    
    let imvProfile = UIImageView()
    let lblName = UILabel()
    let ivBackground = UIImageView()
    let ivSide = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpBackground()
        setUpBackgroundSide()
        setUpImage()
        setUpLabelName()
        setButtons()
        
    }

    func setButtons() {
        let width = UIScreen.main.bounds.width
        
        // Tab meet me
        let btnMeet = UIButton()
        let lblMeet = UILabel()
        let imvMeet = UIImageView()
        let lineMeet = UIView()
        btnMeet.frame = CGRect(x: 0, y: rh(240), width: width, height: rh(70))
        btnMeet.tag = 1
        btnMeet.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        lblMeet.text = "Meet Me"
        lblMeet.frame = CGRect(x: rw(100), y: 0, width: width - rw(80), height: rw(20))
        lblMeet.textColor = Global.shared.mainColor
        lblMeet.center.y = rh(35)
        lblMeet.font = UIFont(name: "Lato-Regular", size: rw(18))
        
        imvMeet.frame = CGRect(x: rw(20), y: 0, width: rh(65), height: rh(65))
        imvMeet.center.y = rh(35)
        imvMeet.image = UIImage(named: "meetMeIcon")
        imvMeet.contentMode = .scaleAspectFit
        
        lineMeet.frame = CGRect(x: 0, y: btnMeet.bounds.maxY, width: width, height: rh(0.5))
        lineMeet.backgroundColor = Global.shared.mainColor
        
        self.addSubview(btnMeet)
        btnMeet.addSubview(imvMeet)
        btnMeet.addSubview(lblMeet)
        btnMeet.addSubview(lineMeet)
        
        // Tab create an event
        let btnCreate = UIButton()
        let lblCreate = UILabel()
        let imvCreate = UIImageView()
        let lineCreate = UIView()
        btnCreate.frame = CGRect(x: 0, y: btnMeet.frame.maxY + rh(1), width: width, height: rh(70))
        btnCreate.tag = 2
        btnCreate.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        lblCreate.text = "Create an Event"
        lblCreate.frame = CGRect(x: rw(100), y: 0, width: width - rw(80), height: rw(20))
        lblCreate.textColor = Global.shared.mainColor
        lblCreate.center.y = rh(35)
        lblCreate.font = UIFont(name: "Lato-Regular", size: rw(18))
        
        imvCreate.frame = CGRect(x: rw(20), y: 0, width: rh(65), height: rh(65))
        imvCreate.center.y = rh(35)
        imvCreate.image = UIImage(named: "Icon_Create_Event")
        imvCreate.contentMode = .scaleAspectFit
        
        lineCreate.frame = CGRect(x: 0, y: btnCreate.bounds.maxY, width: width, height: rh(0.5))
        lineCreate.backgroundColor = Global.shared.mainColor
        
        self.addSubview(btnCreate)
        btnCreate.addSubview(imvCreate)
        btnCreate.addSubview(lblCreate)
        btnCreate.addSubview(lineCreate)
        
        // Tab chat
        let btnChat = UIButton()
        let lblChat = UILabel()
        let imvChat = UIImageView()
        let lineChat = UIView()
        btnChat.frame = CGRect(x: 0, y: btnCreate.frame.maxY + rh(1), width: width, height: rh(70))
        btnChat.tag = 3
        btnChat.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        lblChat.text = "Chat"
        lblChat.frame = CGRect(x: rw(100), y: 0, width: width - rw(80), height: rw(20))
        lblChat.textColor = Global.shared.mainColor
        lblChat.center.y = rh(35)
        lblChat.font = UIFont(name: "Lato-Regular", size: rw(18))
        
        imvChat.frame = CGRect(x: rw(20), y: 0, width: rh(65), height: rh(65))
        imvChat.center.y = rh(35)
        imvChat.image = UIImage(named: "Chat Icone")
        imvChat.contentMode = .scaleAspectFit
        
        lineChat.frame = CGRect(x: 0, y: btnChat.bounds.maxY, width: width, height: rh(0.5))
        lineChat.backgroundColor = Global.shared.mainColor
        
        self.addSubview(btnChat)
        btnChat.addSubview(imvChat)
        btnChat.addSubview(lblChat)
        btnChat.addSubview(lineChat)
        
        // Tab profile
        let btnProfile = UIButton()
        let lblProfile = UILabel()
        let imvProfile = UIImageView()
        let lineProfile = UIView()
        btnProfile.frame = CGRect(x: 0, y: btnChat.frame.maxY + rh(1), width: width, height: rh(70))
        btnProfile.tag = 4
        btnProfile.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        lblProfile.text = "Profile"
        lblProfile.frame = CGRect(x: rw(100), y: 0, width: width - rw(80), height: rw(20))
        lblProfile.textColor = Global.shared.mainColor
        lblProfile.center.y = rh(35)
        lblProfile.font = UIFont(name: "Lato-Regular", size: rw(18))
        
        imvProfile.frame = CGRect(x: rw(20), y: 0, width: rh(65), height: rh(65))
        imvProfile.center.y = rh(35)
        imvProfile.image = UIImage(named: "Profil Icon")
        imvProfile.contentMode = .scaleAspectFit
        
        lineProfile.frame = CGRect(x: 0, y: btnProfile.bounds.maxY, width: width, height: rh(0.5))
        lineProfile.backgroundColor = Global.shared.mainColor
        
        self.addSubview(btnProfile)
        btnProfile.addSubview(imvProfile)
        btnProfile.addSubview(lblProfile)
        btnProfile.addSubview(lineProfile)
        
        // Tab friends
        let btnFriends = UIButton()
        let lblFriends = UILabel()
        let imvFriends = UIImageView()
        let lineFriends = UIView()
        btnFriends.frame = CGRect(x: 0, y: btnProfile.frame.maxY + rh(1), width: width, height: rh(70))
        btnFriends.tag = 5
        btnFriends.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        lblFriends.text = "Friends"
        lblFriends.frame = CGRect(x: rw(100), y: 0, width: width - rw(80), height: rw(20))
        lblFriends.textColor = Global.shared.mainColor
        lblFriends.center.y = rh(35)
        lblFriends.font = UIFont(name: "Lato-Regular", size: rw(18))
        
        imvFriends.frame = CGRect(x: rw(20), y: 0, width: rh(65), height: rh(65))
        imvFriends.center.y = rh(35)
        imvFriends.image = UIImage(named: "Friends_Icone")
        imvFriends.contentMode = .scaleAspectFit
        
        lineFriends.frame = CGRect(x: 0, y: btnFriends.bounds.maxY, width: width, height: rh(0.5))
        lineFriends.backgroundColor = Global.shared.mainColor
        
        self.addSubview(btnFriends)
        btnFriends.addSubview(imvFriends)
        btnFriends.addSubview(lblFriends)
        btnFriends.addSubview(lineFriends)
        
        // Tab settings
        let btnSettings = UIButton()
        let lblSettings = UILabel()
        let imvSettings = UIImageView()

        btnSettings.frame = CGRect(x: 0, y: btnFriends.frame.maxY + rh(1), width: width, height: rh(70))
        btnSettings.tag = 6
        btnSettings.addTarget(self, action: #selector(buttonPressed(sender:)), for: .touchUpInside)
        
        lblSettings.text = "Settings"
        lblSettings.frame = CGRect(x: rw(100), y: 0, width: width - rw(80), height: rw(20))
        lblSettings.textColor = Global.shared.mainColor
        lblSettings.center.y = rh(35)
        lblSettings.font = UIFont(name: "Lato-Regular", size: rw(18))
        
        imvSettings.frame = CGRect(x: rw(20), y: 0, width: rh(65), height: rh(65))
        imvSettings.center.y = rh(35)
        imvSettings.image = UIImage(named: "settings_Icone")
        imvSettings.contentMode = .scaleAspectFit
        
        self.addSubview(btnSettings)
        btnSettings.addSubview(imvSettings)
        btnSettings.addSubview(lblSettings)
        
    }
    
    func setUpImage()  {
        imvProfile.image = UIImage(named: (Global.shared.user?.profileImageUrl)!)
        // imvProfile.image = UIImage(named: "instagram") // Pour testing
        imvProfile.backgroundColor = .white
        imvProfile.frame = CGRect(x: 0, y: rh(102), width: rw(80), height: rw(80))
        imvProfile.center.x = self.center.x
        imvProfile.layer.cornerRadius = rw(80/2)
        imvProfile.layer.masksToBounds = true
        self.addSubview(imvProfile)
    }
    
    func setUpLabelName() {
        lblName.frame = CGRect(x: 0, y: rh(192), width: UIScreen.main.bounds.width, height: rh(21))
        lblName.text = "\(Global.shared.user?.firstName) \(Global.shared.user?.lastName)"
        // lblName.text = "I like trains!" // Pour testing
        lblName.textColor = UIColor().hex("582FC0")
        lblName.textAlignment = .center
        lblName.font = UIFont(name: "Lato-Regular", size: rw(21))
        self.addSubview(lblName)
    }
    
    func setUpBackground() {
        ivBackground.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        ivBackground.image = UIImage(named: "Fond degrade")
        self.addSubview(ivBackground)
    }
    
    func setUpBackgroundSide() {
        ivSide.frame = CGRect(x: rw(278), y: 0, width: rw(100), height: UIScreen.main.bounds.height)
        ivSide.image = UIImage(named: "Side shape")
        self.addSubview(ivSide)
    }
    
    @objc func buttonPressed(sender:UIButton) {
        if (sender.tag != selectedIndex) {
            selectedIndex = sender.tag
            delegate?.selectedIndexChanged(selectedIndex)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
