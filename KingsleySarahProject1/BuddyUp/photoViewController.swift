//
//  photoViewController.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/28/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class photoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, UITextFieldDelegate{
    
    var picture: Picture!
    
    @IBOutlet var ImageView: UIImageView!
    
    @IBOutlet var CameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        if(picture != nil){
            if let img = ImageHelper.getImage(forUID: picture.aUniqueID) {
                // set image view
                ImageView.image = img
            }
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(picture != nil){
            if let img = ImageHelper.getImage(forUID: picture.aUniqueID) {
                // set image view
                ImageView.image = img
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "photoViewTransfer2"{
            let viewChanger = segue.destination as! ViewController
            
            viewChanger.gotpicture = picture
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("bye bye")
    }
    
    @IBAction func AddPic(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.sourceType = .photoLibrary
        print("photo library selected")
        
        picker.delegate = self
        
        present(picker, animated:true, completion:nil)
    }
    
    @IBAction func TakePic(_ sender: Any) {
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
        ImageHelper.saveImage(photo, forUID: picture.aUniqueID)
        
        ImageView.image = photo
        
        dismiss(animated: true, completion: nil)
    }
}


