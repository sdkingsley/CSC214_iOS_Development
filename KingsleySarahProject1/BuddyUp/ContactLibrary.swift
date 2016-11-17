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
    
    override init() {
        super.init()
        addContact("Furguson", "5852755766")
        addContact("Marty", "5852754505")
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
}
