//
//  ViewController.swift
//  Assigment8
//
//  Created by Sarah Kingsley on 11/3/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var changingButton: UIButton!
    @IBOutlet var TextField1: UITextField!
    @IBOutlet var TextField2: UITextField!
    @IBOutlet var TextField3: UITextField!
    @IBOutlet var TextField4: UITextField!
    
    var Page2TextField1: UITextField!
    var Page2TextField2: UITextField!
    var Page2TextField3: UITextField!
    var Page2TextField4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
               //TextField1.text = Page2TextField1.text
               //TextField2.text = Page2TextField2.text
               //TextField3.text = Page2TextField3.text
               //TextField4.text = Page2TextField4.text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "TextfieldTransfer"{
            let textChanger = segue.destination as! ButtonChangerViewController
            textChanger.Page1TextField1 = TextField1
            textChanger.Page1TextField2 = TextField2
            textChanger.Page1TextField3 = TextField3
            textChanger.Page1TextField4 = TextField4
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
}

