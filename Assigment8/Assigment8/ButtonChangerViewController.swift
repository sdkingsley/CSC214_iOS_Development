//
//  ViewController2.swift
//  Assigment8
//
//  Created by Sarah Kingsley on 11/3/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ButtonChangerViewController: UIViewController{
    
    @IBOutlet var TextField1: UITextField!
    @IBOutlet var TextField2: UITextField!
    @IBOutlet var TextField3: UITextField!
    @IBOutlet var TextField4: UITextField!
    
    var Page1TextField1: UITextField!
    var Page1TextField2: UITextField!
    var Page1TextField3: UITextField!
    var Page1TextField4: UITextField!
    
    override func viewWillAppear(_ animated:Bool){
        super.viewWillAppear(animated)
        
//       TextField1.text = Page1TextField1.text
//       TextField2.text = Page1TextField2.text
//       TextField3.text = Page1TextField3.text
//       TextField4.text = Page1TextField4.text
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "TextfieldTransfer"{
            let textChanger = segue.destination as! ViewController
            textChanger.Page2TextField1 = TextField1
            textChanger.Page2TextField2 = TextField2
            textChanger.Page2TextField3 = TextField3
            textChanger.Page2TextField4 = TextField4
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
}
