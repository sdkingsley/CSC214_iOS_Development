//
//  ViewController.swift
//  Assignment7
//
//  Created by Sarah Kingsley on 10/31/16.
//  Copyright © 2016 Sarah Kingsley. All rights reserved.
//

import UIKit

class MakeupViewController: UITableViewController {
    
    var makeup: Makeup!
    let FACE = 0
    let LIPS = 1
    let EYES = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let statusBarHeight = UIApplication.shared.statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 75
        
        makeup = Makeup()
        
//        for _ in 0..<5 {
//            _ = makeup.addRandomFace()
//            _ = makeup.addRandomLips()
//            _ = makeup.addRandomEyes()
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFace(_ sender: AnyObject) {
        if let index = makeup.addRandomFace() {
            let indexPath = NSIndexPath(row: index, section: FACE)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
    @IBAction func addLip(_ sender: AnyObject) {
        if let index = makeup.addRandomLips() {
            let indexPath = NSIndexPath(row: index, section: LIPS)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
    @IBAction func addEye(_ sender: AnyObject) {
        if let index = makeup.addRandomEyes() {
            let indexPath = NSIndexPath(row: index, section: EYES)
            tableView.insertRows(at: [indexPath as IndexPath], with: .automatic)
        }
    }
    
    @IBAction func edit(_ sender: UIButton) {
        if isEditing == false {
            setEditing(true, animated: true)//turns the thing on if its off
            sender.setTitle("Done", for: .normal)
        }
        else {
            setEditing(false, animated: true)//turns the the off if its on
            sender.setTitle("Edit", for: .normal)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func getSectionHeader(_ sectionNumber: Int) -> String? { //different title from slides
        switch sectionNumber {
        case FACE:
            return "face"
        case LIPS:
            return "lips"
        case EYES:
            return "eyes"
        default:
            return nil
        }
    }
    
    func getNumberOfRowsInSection(_ sectionNumber: Int) -> Int {
        switch(sectionNumber){
        case FACE:
            return makeup.faces.count
        case LIPS:
            return makeup.listlips.count
        case EYES:
            return makeup.listeyes.count
        default:
            return 0
        }
    }
    
    func getTableCell(_ path: IndexPath ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MakeupCell", for: path) as! MakeupCell
        
        cell.updateLabels()
        
        switch(path.section) {
        case FACE:
            let face = makeup.faces[path.row]
            cell.title?.text = face.kind
            cell.detail1?.text = "\(face.brand)"
            cell.detail2?.text = ""
        case LIPS:
            let lips = makeup.listlips[path.row]
            cell.title?.text = lips.kind
            cell.detail1?.text = "\(lips.brand)"
            cell.detail2?.text = "\(lips.color)"
        case EYES:
            let eyes = makeup.listeyes[path.row]
            cell.title?.text = eyes.kind
            cell.detail1?.text = "\(eyes.brand)"
            cell.detail2?.text = "\(eyes.tone)"
        default:
            cell.title?.text = "Unknown"
        }
        
        return cell
    }
    
    func deleteRow(_ path: IndexPath) {
        switch(path.section) {
        case FACE:
            let face = makeup.faces[path.row]
            verifyDelete(face.kind, {
                (action) -> Void in
                self.makeup.removeFace(face)
                self.tableView.deleteRows(at: [path], with: .automatic)
            })
        case LIPS:
            let lips = makeup.listlips[path.row]
            verifyDelete(lips.kind, {
                (action) -> Void in
                self.makeup.removeLips(lips)
                self.tableView.deleteRows(at: [path], with: .automatic)
            })
        case EYES:
            let eyes = makeup.listeyes[path.row]
            verifyDelete(eyes.kind, {
                (action) -> Void in
                self.makeup.removeEyes(eyes)
                self.tableView.deleteRows(at: [path], with: .automatic)
            })
        default:
            break
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

    func moveRow(_ from: IndexPath, _ to: IndexPath) {
        switch(from.section) {
        case FACE:
            makeup.moveFace(from.row, to.row)
        case LIPS:
            makeup.moveLips(from.row, to.row)
        case EYES:
            makeup.moveEyes(from.row, to.row)
        default:
            break
        }
    }


    //
    // pulled from lecture code
    //
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return getSectionHeader(section)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getNumberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return getTableCell(indexPath)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deleteRow(indexPath)
        }
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveRow(sourceIndexPath, destinationIndexPath)
    }


}

