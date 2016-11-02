//
//  Face.swift
//  Assignment7
//
//  Created by Sarah Kingsley on 10/31/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class Face: NSObject {
    var kind: String
    var brand: String
    
    init(_ kind: String, _ brand: String) {
        self.kind = kind
        self.brand = brand
    }
}
