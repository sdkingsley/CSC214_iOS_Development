//
//  ViewController.swift
//  Sarah_Kingsley_Assignment3
//
//  Created by Sarah Kingsley on 9/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("ViewController viewDidLoad() called")
        view.backgroundColor = UIColor(colorLiteralRed: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomfloat() -> Float {
        return Float(arc4random())/Float(UINT32_MAX)
    }
    
    
    func randomColor() -> UIColor {
        return UIColor(colorLiteralRed: 1.0,
                       green: randomfloat(),
                       blue: randomfloat(),
                       alpha: 1.0) // always opaque
    }

    @IBAction func screentapped() {
        view.backgroundColor = randomColor()
    }
}

