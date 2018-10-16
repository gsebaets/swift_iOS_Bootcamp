//
//  Article+CoreDataProperties.swift
//  
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/12.
//
//

import Foundation
import CoreData


extension Article {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Article> {
        return NSFetchRequest<Article>(entityName: "Article")
    }

    @NSManaged public var content: String?
    @NSManaged public var creationDate: NSDate?
    @NSManaged public var image: NSData?
    @NSManaged public var lang: String?
    @NSManaged public var modificationDate: NSDate?
    @NSManaged public var title: String?

}
