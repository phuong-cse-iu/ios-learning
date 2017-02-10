//
//  SectionMenu.swift
//  ZingLayoutClone
//
//  Created by TranTPhuong on 12/26/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import UIKit

struct SectionMenu {
    var sectionId:String
    var menuList:Array<Menu>
    var sectionTitle:String
    
    init() {
        sectionId = ""
        menuList = []
        sectionTitle = ""
    }
    
    init(id:String, title:String, list:Array<Menu>) {
        sectionId = id
        sectionTitle = title
        menuList = list
    }
}
