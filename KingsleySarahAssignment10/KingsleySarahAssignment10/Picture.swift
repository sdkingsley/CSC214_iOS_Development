//
//  Picture.swift
//  KingsleySarahAssignment10
//
//  Created by Sarah Kingsley on 12/13/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class Picture: NSObject, NSCoding {
    static let aUniqueIDKey = "aUniqueID"
    
    var aUniqueID: String
    
    override init() {
        aUniqueID = NSUUID().uuidString
    }
    
    required init(coder aDecoder: NSCoder) {
        aUniqueID = aDecoder.decodeObject(forKey: Picture.aUniqueIDKey) as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(aUniqueID, forKey: Picture.aUniqueIDKey)
    }
    
}
