//
//  PicturePersistor.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//


import UIKit

class PicturePersister: NSObject{
    static let pictureArchiveURL: NSURL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent("picture.archive") as NSURL
    } ()
    
    class func setPicture(_ picture: Picture) -> Bool{
        return NSKeyedArchiver.archiveRootObject(picture, toFile: pictureArchiveURL.path!)
    }
    
    class func getPicture() -> Picture {
        if let picture = NSKeyedUnarchiver.unarchiveObject(withFile: pictureArchiveURL.path!) as? Picture {
            return picture
        }
        else {
            return Picture()
        }
    }
}
