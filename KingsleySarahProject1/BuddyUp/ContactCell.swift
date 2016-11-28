//
//  ContactCell.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//
import UIKit

class StuffCell: UITableViewCell {
    @IBOutlet var name: UILabel!
    @IBOutlet var number: UILabel!
    @IBOutlet var image: UIImage!
    
    func updateLabels() {
        let bodyFont = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        title.font = bodyFont
        
        let caption1Font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.caption1)
        detail1.font = caption1Font
        detail2.font = caption1Font
    }
}
