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
    
    @IBOutlet var TeamLabel: UILabel! //label for string of team names
    var contacts: ContactLibrary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //Navigation
//    @IBAction func unwindContacts(sender: UIStoryboardSegue) {
//        if let sourceViewController = sender.source as? NumbersViewController, contacts.contacts = sourceViewController.library.contacts {
//            
//            var NamesList:String = "Team: "
//            
//            if(contacts != nil){
//                for name in contacts.getNames(){
//                    NamesList.append(name + " ")
//                }
//            }
//            
//            TeamLabel.text = NamesList
//        }
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        var NamesList:String = "Team: "
        
        if(contacts != nil){
            for name in contacts.getNames(){
                NamesList.append(name + " ")
            }
        }
        
        TeamLabel.text = NamesList
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        if segue.identifier == "ViewTransfer"{
            
            let viewChanger = segue.destination as! NumbersViewController
            
            viewChanger.library = contacts
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //RESOURCE: https://developer.apple.com/reference/messageui/mfmessagecomposeviewcontroller
    @IBAction func RedFlag(_ sender: AnyObject) {
        
        let messageVC = MFMessageComposeViewController()
        messageVC.messageComposeDelegate = self
        
        messageVC.recipients = contacts.getNumbers()
        messageVC.body = "🙅🏼"
        
        self.present(messageVC, animated:true, completion: nil)
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    
}

