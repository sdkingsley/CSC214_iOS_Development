//
//  View2Controller.swift
//  Sarah_Kingsley_Assignment3
//
//  Created by Sarah Kingsley on 9/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class View2Controller:UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("View2Controller viewDidLoad() called")
        view.backgroundColor = UIColor(colorLiteralRed: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    }
    
    func randomfloat() -> Float {
        return Float(arc4random())/Float(UINT32_MAX)
    }
    
    
    func randomColor() -> UIColor {
        return UIColor(colorLiteralRed: randomfloat(),
                       green: 1.0,
                       blue: randomfloat(),
                       alpha: 1.0) // always opaque
    }
    
    @IBAction func buttonPressed(_ sender: AnyObject) {
        view.backgroundColor = randomColor()
    }
    
}
