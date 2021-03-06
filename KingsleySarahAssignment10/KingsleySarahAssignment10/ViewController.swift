//
//  ViewController.swift
//  KingsleySarahAssignment10
//
//  Created by Sarah Kingsley on 12/13/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var urlField: UITextField!
    @IBOutlet var imageView: UIImageView!
    var picture: Picture!
    
    let imageFetcher = ImageFetcher()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let img = ImageHelper.getImage(forUID: picture.aUniqueID) {
            // set image view
            imageView.image = img
        }
        
        imageView.layer.masksToBounds = true
    }
    
    @IBAction func fetchImage(_ sender: Any) {
        let url = urlField.text!
        
        imageFetcher.fetchImage(url: url) {
            (fetchResult) -> Void in
            
            switch(fetchResult) {
            case let .ImageSuccess(image):
                OperationQueue.main.addOperation() {
                    ImageHelper.saveImage(image, forUID: self.picture.aUniqueID)
                    self.imageView.image = image
                }
            case let .ImageFailure(error):
                OperationQueue.main.addOperation {
                    self.imageView.image = UIImage(named:"oops")
                }
                print("error: \(error)")
            }
            
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

