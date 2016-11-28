//
//  contatcsPersistor.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class contactsPerister: NSObject {
    static let contactsArchiveURL: NSURL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("ContactLibrary.archive") as NSURL
    }()
    
    class func getContacts() -> ContactLibrary {
        if let contacts = NSKeyedUnarchiver.unarchiveObject(withFile: contactsArchiveURL.path!) as? ContactLibrary {
            return contacts
        }
        else {
            return ContactLibrary()
        }
    }
    
    class func setContacts(_ contacts: ContactLibrary) -> Bool {
        return NSKeyedArchiver.archiveRootObject(ContactLibrary(), toFile: contactsArchiveURL.path!)
    }
}
