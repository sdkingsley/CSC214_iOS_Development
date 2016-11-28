//
//  ContactLibrary.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ContactLibrary: NSObject, NSCoding{
    var contacts: [Contact] = []
    static let contactsArrayKey = "contacts"
    
    override init() {
        super.init()
    }
    
    func addContact(_ contact:Contact) -> Int{
        contacts.append(contact)
        return contacts.index(of: contact)!
    }
    
    func addContact(_ name: String, _ number: String) {
        let contact = Contact(name, number)
        addContact(contact)
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
    
    func createNewContact(_ name:String, _ number:String) -> Int? {
        return addContact(Contact(name, number))
    }
    
    func getNumbers() -> [String]{
        var nums:[String] = []
        
        for contact in contacts{
            nums.append(contact.number)
        }
        
        return nums
    }
    
    func getNames() -> [String]{
        var names:[String] = []
        
        for contact in contacts{
            names.append(contact.name)
        }
        
        return names
    }
    
    // encodes (serializes) contact library
    func encode(with aCoder: NSCoder) {
        aCoder.encode(contacts, forKey: ContactLibrary.contactsArrayKey)
    }
    
    // decodes (deserializes) contact library
    required init(coder aDecoder: NSCoder) {
        contacts = aDecoder.decodeObject(forKey: ContactLibrary.contactsArrayKey) as! [Contact]
    }
}
