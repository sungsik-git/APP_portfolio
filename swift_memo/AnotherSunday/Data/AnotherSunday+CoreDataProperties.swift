//
//  AnotherSunday+CoreDataProperties.swift
//  AnotherSunday
//
//  Created by KimSungSik on 2023/08/19.
//
//

import Foundation
import CoreData


extension AnotherSunday {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AnotherSunday> {
        return NSFetchRequest<AnotherSunday>(entityName: "AnotherSunday")
    }

    @NSManaged public var userName: String?
    @NSManaged public var insertDate: Date?

}

extension AnotherSunday : Identifiable {

}
