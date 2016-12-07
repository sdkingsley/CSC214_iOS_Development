//
//  contact.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

//RESOURCE: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson10.html

class Contact:NSObject{
    var name: String
    var number: String
    
    init(_ name:String, _ number:String){
        self.name = name
        self.number = number
    }
}
