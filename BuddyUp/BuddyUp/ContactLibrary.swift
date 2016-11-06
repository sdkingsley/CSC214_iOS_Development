//
//  ContactLibrary.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ContactLibrary {
    var contacts = [Contact]()
    
    // convenience method to fill the library with a few games
//    init() {
//        addContact("Sarah", "5859674979")
//        addContact("Ellaina", "4842643061")
//        
//    }
    
    func addContact(_ contact:Contact){
        contacts.append(contact)
    }
    
    func addContact(_ name:String, _ number:String){
        let contact = Contact(name,number)
        addContact(contact)
    }
}
