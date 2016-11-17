//
//  NumbersViewController.swift
//  BuddyUp
//
//  Created by Sarah Kingsley on 11/5/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class NumbersViewController: UITableViewController, UITextFieldDelegate{
    var library: ContactLibrary!
    @IBOutlet var NameTextview: UITextField!
    @IBOutlet var NumberTextview: UITextField!
    var numbers: [String] = []
    
    func getNumbers() -> [String]{
        return numbers
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        library = ContactLibrary()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        // Do any additional setup after loading the view, typically from a nib.
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
        
        numbers.append(newNumber)
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
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let contact = library.contacts[indexPath.row]
            verifyDelete(contact.name, { (action) -> Void in
                self.library.removeContact(contact)
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.numbers.remove(at: self.numbers.index(of: contact.number)!)
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
    }
    
    @IBAction func dismissKeyboard(_ sender: AnyObject) {
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
    

}
