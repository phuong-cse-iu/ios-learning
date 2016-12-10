//
//  ItemType+CoreDataProperties.swift
//  DreamLister
//
//  Created by TranTPhuong on 12/1/16.
//  Copyright © 2016 Nearby Host. All rights reserved.
//

import Foundation
import CoreData


extension ItemType {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ItemType> {
        return NSFetchRequest<ItemType>(entityName: "ItemType");
    }

    @NSManaged public var type: String?
    @NSManaged public var toItem: Item?

}
