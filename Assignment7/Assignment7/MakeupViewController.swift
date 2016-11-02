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
        
        for _ in 0..<5 {
            _ = makeup.addRandomFace()
            _ = makeup.addRandomLips()
            _ = makeup.addRandomEyes()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            deleteRow(indexPath)
//        }
//    }
//    
//    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        moveRow(sourceIndexPath, destinationIndexPath)
//    }


}

