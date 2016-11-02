//
//  MakeupCell.swift
//  Assignment7
//
//  Created by Sarah Kingsley on 10/31/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class MakeupCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet var detail1: UILabel!
    @IBOutlet var detail2: UILabel!
    
    func updateLabels() {
        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        title.font = caption1Font
        
        let caption2Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption2)
        detail1.font = caption2Font
        detail2.font = caption2Font
    }
}
