//
//  Article+CoreDataClass.swift
//  
//
//  Created by Gaolatlhwe SEBAETSE on 2018/10/12.
//
//

import Foundation
import CoreData

@objc(Article)
public class Article: NSManagedObject {
    
    public var content: String?
    public var creationDate: NSDate?
    public var image: NSData?
    public var language: String?
    public var modificationDate: NSDate?
    public var title: String?
    
    override public var Description: String{
        return "[\(title): \(content) Lang:\(language) Img:\(image) Created:\(creationDate) Modification:\(modificationDate)]"
    }
}
