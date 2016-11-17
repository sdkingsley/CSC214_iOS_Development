//
//  ViewController.swift
//  KingsleySarahAssignment9
//
//  Created by Sarah Kingsley on 11/15/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate{

    @IBOutlet var ImageView: UIImageView!
    
    @IBOutlet var CameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func AddPhoto(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        print("photo library selected")
        
        picker.delegate = self
        
        present(picker, animated:true, completion:nil)
    }
    
    @IBAction func TakePicture(_ sender: Any) {
        let picker = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            picker.sourceType = .camera
            print("camera selected")
        }else{
            CameraButton.isEnabled = false
        }
        
        picker.delegate = self
        
        present(picker, animated:true, completion:nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let photo = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        ImageView.image = photo
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func AspectFit(_ sender: Any) {
        ImageView.contentMode = UIViewContentMode.scaleAspectFit
    }
    
    @IBAction func ScaleToFit(_ sender: Any) {
        ImageView.contentMode = UIViewContentMode.scaleToFill
    }
}

