//
//  Photo.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class Picture: NSObject, NSCoding {
    var aUniqueID: String
    static let aUniqueIDKey = "aUniqueID"
    
    override init(){
        aUniqueID = NSUUID().uuidString
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(aUniqueID, forKey: Picture.aUniqueIDKey)
    }
    
    required init(coder aDecoder: NSCoder){
        aUniqueID = aDecoder.decodeObject(forKey: Picture.aUniqueIDKey) as! String
    }
}
