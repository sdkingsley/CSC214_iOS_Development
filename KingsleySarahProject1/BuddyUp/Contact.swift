//
//  contact.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

//RESOURCE: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson10.html

class Contact:NSObject,NSCoding{
    var name: String
    var number: String
    
    init(_ name:String, _ number:String){
        self.name = name
        self.number = number
    }
    
    // Properties
    struct PropertyKey {
        static let nameKey = "name"
        static let numberKey = "number"
    }
    
    // Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("contacts")
    
    //NSCoding
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(number, forKey: PropertyKey.numberKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String
        let number = aDecoder.decodeObject(forKey: PropertyKey.numberKey) as! String
        
        self.init(name, number)
    }
    
}
