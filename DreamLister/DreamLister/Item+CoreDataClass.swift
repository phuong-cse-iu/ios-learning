//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by TranTPhuong on 12/1/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.created = NSDate()
    }
}
