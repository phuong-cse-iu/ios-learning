//
//  Menu.swift
//  ZingLayoutClone
//
//  Created by TranTPhuong on 12/26/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit

struct Menu {
    var menuId:String
    var menuIcon:String
    var menuTitle:String
    var playList:Array<Song>
    
    init() {
        menuId = ""
        menuIcon = ""
        menuTitle = ""
        playList = []
    }
    
    init(menuId:String, menuIcon:String, menuTitle:String, playList:Array<Song>) {
        self.menuId = menuId
        self.menuIcon = menuIcon
        self.menuTitle = menuTitle
        self.playList = playList
    }
}
