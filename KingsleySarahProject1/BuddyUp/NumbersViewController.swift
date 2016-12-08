//
//  NumbersViewController.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class NumbersViewController: UITableViewController, UITextFieldDelegate{
    var library = contactsPerister.getContacts()
    @IBOutlet var NameTextview: UITextField!
    @IBOutlet var NumberTextview: UITextField!
    @IBOutlet var SaveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library.contacts = [Contact]()
        
        if let savedContacts = loadContacts() {
            library.contacts += savedContacts
        }
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    //Navigation
    
    //Legacy
    //    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
    //        if segue.identifier == "ViewTransfer2"{
    //            let viewChanger = segue.destination as! ViewController
    //
    //            viewChanger.contacts = library
    //        }
    //    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if sender as AnyObject? === SaveButton {
            //TODO
//            let contacts = library
        }
    }
    
    @IBAction func Cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int{
            return library.contacts.count
    }
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath:IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "UITableViewCell")
        
        let contact = library.contacts[indexPath.row]
        
        cell.textLabel?.text = contact.name
        cell.detailTextLabel?.text = "\(contact.number)"
        
        return cell
    }
    
    let DEFAULT_NAME = "name"
    let DEFAULT_NUMBER = "5555555555"
    
    @IBAction func addContact(_ sender: Any) {
        var newName = ""
        var newNumber = ""
        
        if let newText = NameTextview.text{
            newName = newText
        }else{
            newName = DEFAULT_NAME
        }
        
        if let newText = NumberTextview.text{
            newNumber = newText
        }else{
            newNumber = DEFAULT_NUMBER
        }
        
        if let index = library.createNewContact(newName, newNumber) {
            let indexPath = NSIndexPath(row: index, section: 0)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
        
        saveContacts()
    }
    
    @IBAction func editList(_ sender: UIButton) {
        if isEditing == false {
            setEditing(true, animated: true)//turns the thing on if its off
            sender.setTitle("Done", for: .normal)
        }
        else {
            setEditing(false, animated: true)//turns the the off if its on
            sender.setTitle("Edit", for: .normal)
        }
        
        saveContacts()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = library.contacts[indexPath.row]
            verifyDelete(contact.name, { (action) -> Void in
                self.library.removeContact(contact)
                self.saveContacts()
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
            })
        }
    }
    
    func verifyDelete(_ name: String, _ delete: @escaping (UIAlertAction) -> Void) {
        let title = "Delete \(name)?"
        let message = "Are you sure that you want to delete this item?"
        
        let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        ac.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: delete)
        ac.addAction(deleteAction)
        
        present(ac, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        library.moveContact(sourceIndexPath.row, destinationIndexPath.row)
        
        saveContacts()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func dissmissKeyboard(_ sender: Any) {
        NameTextview.resignFirstResponder()
        NumberTextview.resignFirstResponder()
        
    }
    
    //Modified from this resource: http://stackoverflow.com/questions/433337/set-the-maximum-character-length-of-a-uitextfield
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        if(textField == NumberTextview){
            let currentCharacterCount = textField.text?.characters.count ?? 0
            if (range.length + range.location > currentCharacterCount){
                return false
            }
            let newLength = currentCharacterCount + string.characters.count - range.length
            return newLength <= 10
        }else{
            return true
        }
    }
    
    
    //RESOURCE: https://developer.apple.com/library/content/referencelibrary/GettingStarted/DevelopiOSAppsSwift/Lesson10.html
    //NSCoding
    func saveContacts() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(library, toFile: Contact.ArchiveURL.path)
        
        if !isSuccessfulSave {
            print("Failed to save contacts...")
        }
    }
    
    func loadContacts() -> [Contact]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Contact.ArchiveURL.path) as? [Contact]
    }
}
