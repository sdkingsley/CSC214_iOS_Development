//
//  Eyes.swift
//  Assignment7
//
//  Created by Sarah Kingsley on 10/31/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class Eyes: Face {
    var tone: String
    
    init(_ kind: String, _ brand: String, _ tone: String) {
        self.tone = tone
        super.init(kind, brand)
    }
}
