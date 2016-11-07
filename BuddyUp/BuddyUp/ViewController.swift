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
    @IBOutlet var LongPressLabelAnimate: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !MFMessageComposeViewController.canSendText() {
            print("SMS services are not available")
        }
        
        animateOpacity()
        
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
        
        messageVC.recipients = ["5859674979","4842643061"]
        messageVC.body = "🙅🏼"
        
        self.present(messageVC, animated:true, completion: nil)
        
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController,
                                      didFinishWith result: MessageComposeResult) {
        // Check the result or perform other tasks.
        
        // Dismiss the message compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }

    func animateOpacity() {
        
        UIView.animate(
            withDuration: 2,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.LongPressLabelAnimate.alpha = 0
                
        },
            completion: { (Bool) -> Void in
                self.animateOpacityBack()
        })
    }
    
    func animateOpacityBack() {
        UIView.animate(
            withDuration: 3,
            animations: { () -> Void in
                self.LongPressLabelAnimate.alpha = 1
        })
    }
    
    func animateMovement() {
        let height = view.frame.height
        self.LongPressLabel.constant += height/10
        
        let movementClosure = { () -> Void in
            self.view.layoutIfNeeded()
        }
        
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: [.curveLinear],
            animations: movementClosure,
            completion: { (Bool) -> Void in
                self.animateMovementBack()
        })
    }

    
    func animateMovementBack() {
        let height = view.frame.height
        self.LongPressLabel.constant -= height/10
        UIView.animate(
            withDuration: 0.2,
            animations: { _ in
                self.view.layoutIfNeeded()
        })
    }
    
    func animateBackground() {
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: [],
            animations: { () -> Void in
                self.view.backgroundColor = UIColor.lightGray
        },
            completion: { (Bool) -> Void in
                UIView.animate(
                    withDuration: 0.2,
                    animations: { () -> Void in
                        self.view.backgroundColor = UIColor.white
                })
        })
    }
    
    @IBAction func WrongAnimations(_ sender: Any) {
        animateMovement()
        animateBackground()
    }
}

