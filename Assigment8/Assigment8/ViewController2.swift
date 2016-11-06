//
//  ViewController2.swift
//  Assigment8
//
//  Created by Sarah Kingsley on 11/3/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ButtonChangerViewController: UIViewController{
    
    @IBOutlet var buttonName: UITextField!
    
    var theButton: UIButton!
    
    override func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
        
        buttonName.text = theButton.titleLabel!.text
    }
}
