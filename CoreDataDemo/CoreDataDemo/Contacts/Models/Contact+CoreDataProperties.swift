//
//  Contact+CoreDataProperties.swift
//  Contact
//
//  Created by Kamlesh on 06/10/21.
//
//

import Foundation
import CoreData


extension Contact {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Contact> {
        return NSFetchRequest<Contact>(entityName: "Contact")
    }

    @NSManaged public var address: String?
    @NSManaged public var name: String?

}

extension Contact : Identifiable {

}
