//
//  Photo.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class Picture: NSObject, NSCoding {
    var aString: String
    static let aUniqueIDKey = "aUniqueID"
    
    static let aStringKey = "aString"
    var aUniqueID: String
    
    override init(){
        aString = "caption"
        aUniqueID = NSUUID().uuidString
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(aString, forKey: Picture.aStringKey)
        aCoder.encode(aUniqueID, forKey: Picture.aUniqueIDKey)
    }
    
    required init(coder aDecoder: NSCoder){
        aString = aDecoder.decodeObject(forKey: Picture.aStringKey) as! String
        aUniqueID = aDecoder.decodeObject(forKey: Picture.aUniqueIDKey) as! String
    }
}
