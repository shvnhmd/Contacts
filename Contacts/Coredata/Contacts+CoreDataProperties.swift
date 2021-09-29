//
//  Contacts+CoreDataProperties.swift
//  Contacts
//
//  Created by Ikhtiar Ahmed on 11/22/20.
//
//

import Foundation
import CoreData


extension Contacts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contacts> {
        return NSFetchRequest<Contacts>(entityName: "Contacts")
    }

    @NSManaged public var number: String?
    @NSManaged public var name: String?

}

extension Contacts : Identifiable {

}
