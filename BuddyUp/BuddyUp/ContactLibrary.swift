//
//  ContactLibrary.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ContactLibrary: NSObject{
    var contacts: [Contact] = []
    
    // convenience method to fill the library with a few games
//    init() {
//        addContact("Sarah", "5859674979")
//        addContact("Ellaina", "4842643061")
//    }
    
    func addContact(_ contact:Contact) -> Int{
        contacts.append(contact)
        return contacts.index(of: contact)!
    }
    
    func removeContact(_ contact:Contact){
        if let index = contacts.index(of: contact){
            contacts.remove(at: index)
        }
    }
    
    func moveContact(_ fromIndex:Int, _ toIndex:Int){
        if fromIndex != toIndex{
            let face = contacts[fromIndex]
            contacts.remove(at: fromIndex)
            contacts.insert(face, at: toIndex)
        }
    }
}
