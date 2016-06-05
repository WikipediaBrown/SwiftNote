//
//  ViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    var notes = ["Jiggaboo", "Coon", "Darky"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "SwiftNote"
        
        tableView.registerClass(NoteCellTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.registerClass(CollectionHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
        tableView.sectionHeaderHeight = 50
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let noteCell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath) as! NoteCellTableViewCell
        noteCell.noteLabel.text = notes[indexPath.row]
        noteCell.mainViewController = self
        return noteCell
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableView.dequeueReusableHeaderFooterViewWithIdentifier("headerId")
    }
    
    func deleteCell(cell: UITableViewCell) {
        if let deleteionPath = tableView.indexPathForCell(cell) {
            notes.removeAtIndex(deleteionPath.row)
            tableView.deleteRowsAtIndexPaths([deleteionPath], withRowAnimation: .Automatic)
        
        }
        
    }
}

