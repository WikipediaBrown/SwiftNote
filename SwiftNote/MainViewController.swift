//
//  ViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import RealmSwift

class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        try! realm.write {
            
            notes = realm.objects(noteData)
        }
        
        navigationItem.title = "SwiftNote"
        
        tableView.registerClass(NoteCellTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.registerClass(CollectionHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        
        tableView.sectionHeaderHeight = 50
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create Note", style: .Plain, target: self, action: #selector(MainViewController.insertCell))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Batch Insert", style: .Plain, target: self, action: #selector(MainViewController.insertBatch))
        
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainViewController.reloadTableData(_:)), name: "reload", object: nil)
        
        
    }
    
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    func reloadTableData(notification: NSNotification) {
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //return notes.count
        return notes!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let noteCell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath) as! NoteCellTableViewCell
        
        noteCell.noteLabel.text = notes![indexPath.row].note
        noteCell.mainViewController = self
        return noteCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let noteDetailViewController = NoteDetailViewController()
        noteDetailViewController.selectedRow = indexPath.row
        self.navigationController?.pushViewController(noteDetailViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        return tableView.dequeueReusableHeaderFooterViewWithIdentifier("headerId")
    }
    
    //------------------------------------------------------------
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        
        let swipeShare = UITableViewRowAction(style: .Normal, title: "Share") { (action: UITableViewRowAction, indexPath: NSIndexPath) in
            
            let noteToShare = notes![indexPath.row].note
            let activityViewController = UIActivityViewController(activityItems: [noteToShare], applicationActivities: nil)
            self.presentViewController(activityViewController, animated: true, completion: nil)
        }
        let swipeDelete = UITableViewRowAction(style: .Default, title: "Delete") { (action: UITableViewRowAction, indexPath: NSIndexPath) in
            
            try! realm.write {
                
                realm.delete(notes![indexPath.row])
            }
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
        swipeShare.backgroundColor = UIColor.blueColor()
        return [swipeDelete, swipeShare]
    }
    //------------------------------------------------------------
    
    func favoriteNote(cell: UITableViewCell) {
        if let favoritePath = tableView.indexPathForCell(cell) {
            try! realm.write {
                if notes![favoritePath.row].favorited == true {
                    
                    notes![favoritePath.row].favorited = false
                } else {
                    
                    notes![favoritePath.row].favorited = true
                }
            }
        }
        
    }
    
    
    
    func insertBatch() {
        
        print(notes)
    }
    
    func insertCell() {
        
        let makeNoteViewController = MakeNoteViewController()
        makeNoteViewController.modalPresentationStyle = .OverCurrentContext
        self.presentViewController(makeNoteViewController, animated: true, completion: nil)
        
    }
}

