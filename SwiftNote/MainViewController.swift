//
//  ViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        navigationItem.title = "SwiftNote"
        
        tableView.registerClass(NoteCellTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.registerClass(CollectionHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
        tableView.sectionHeaderHeight = 50
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create Note", style: .Plain, target: self, action: #selector(MainViewController.insertCell))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Batch Insert", style: .Plain, target: self, action: #selector(MainViewController.insertBatch))
        tableView.reloadData()

        
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
    
    func insertBatch() {
        /*var indexPaths = [NSIndexPath]()
        for i in notes.count...notes.count + 5 {
            notes.append("Note \(i + 1)")
            indexPaths.append(NSIndexPath(forRow: i, inSection: 0))
            
        }
        
        var bottomHalfIndexPaths = [NSIndexPath]()
        for _ in 0...indexPaths.count / 2 - 1 {
            bottomHalfIndexPaths.append(indexPaths.removeLast())
        }
        
        tableView.beginUpdates()
        
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Right)
        tableView.insertRowsAtIndexPaths(bottomHalfIndexPaths, withRowAnimation: .Left)
        
        tableView.endUpdates()*/

        print(notes)
    }
        
    func insertCell() {
        
        let yourTargetController = MakeNoteViewController()
        yourTargetController.modalPresentationStyle = .OverCurrentContext
        self.presentViewController(yourTargetController, animated: true, completion: nil)
        
    }
}

