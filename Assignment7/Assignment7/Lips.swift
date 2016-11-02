//
//  Lips.swift
//  Assignment7
//
//  Created by Sarah Kingsley on 10/31/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class Lips: Face {
    var color: String
    
    init(_ kind: String, _ brand: String, _ color: String) {
        self.color = color
        super.init(kind, brand)
    }
}
