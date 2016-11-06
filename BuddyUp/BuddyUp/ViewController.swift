//
//  ViewController.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    
    @IBOutlet var LongPressLabel: NSLayoutConstraint!
    var library: ContactLibrary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library = ContactLibrary()
        
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //RESOURCE: https://developer.apple.com/reference/messageui/mfmessagecomposeviewcontroller
    @IBAction func RedFlag(_ sender: AnyObject) {
        
        let messageVC = MFMessageComposeViewController()
        messageVC.messageComposeDelegate = self
        
        for _ in library.contacts{
            let num = (library.contacts.popLast()?.number)!
            messageVC.recipients = [num]
            print("NUMBER" + num)
            messageVC.body = "🙅🏼"
        }
        
        self.present(messageVC, animated:true, completion: nil)
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }

    
    
}

