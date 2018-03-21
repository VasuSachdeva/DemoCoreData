//
//  User+CoreDataProperties.swift
//  DemoCoreData
//
//  Created by MAC on 06/03/18.
//  Copyright © 2018 Appinventiv. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var password: String?
    @NSManaged public var name: String?
    @NSManaged public var mobilenumber: String?

}
