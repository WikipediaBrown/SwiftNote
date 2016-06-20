//
//  ViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import RealmSwift
import IoniconsSwift

//------------------------------------------------------------
class MainViewController: UITableViewController {
    
    //------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------------------------------------------
        self.navigationController?.navigationBar.hidden = false
        //------------------------------------------------------------
        
        
        //------------------------------------------------------------
        try! realm.write {
            
            notes = realm.objects(noteData).sorted("lastEdited", ascending: false)
        }
        //------------------------------------------------------------
        
        //------------------------------------------------------------
        navigationItem.title = "SwiftNote"
        //------------------------------------------------------------
        
        //------------------------------------------------------------
        tableView.registerClass(NoteCellTableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.registerClass(CollectionHeader.self, forHeaderFooterViewReuseIdentifier: "headerId")
        tableView.sectionHeaderHeight = 50
        tableView.separatorStyle = .None
        //------------------------------------------------------------
        
        
        //------------------------------------------------------------
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Ionicons.IosComposeOutline.image(35), style: .Plain, target: self, action: #selector(MainViewController.showCreateNoteModal))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Ionicons.Funnel.image(28), style: .Plain, target: self, action: #selector(MainViewController.sortNoteTable))
        //------------------------------------------------------------
        
        //------------------------------------------------------------
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(MainViewController.reloadTableData(_:)), name: "reload", object: nil)
        //------------------------------------------------------------
        
    }
    //------------------------------------------------------------
    
    
    
    //------------------------------------------------------------
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    //------------------------------------------------------------
    
    //------------------------------------------------------------
    func reloadTableData(notification: NSNotification) {
        try! realm.write {
            
            notes = realm.objects(noteData).sorted("lastEdited", ascending: false)
        }
        
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let noteCell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath) as! NoteCellTableViewCell
        
        noteCell.noteLabel.text = notes![indexPath.row].note
        
        
        try! realm.write {
            if notes![indexPath.row].favorited == true {
                
                noteCell.favoriteButton.setImage(Ionicons.IosHeart.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
            } else {
                
                noteCell.favoriteButton.setImage(Ionicons.IosHeartOutline.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
                
            }
        }
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
    
    var sorted = false
    
    func sortNoteTable() {
        
        if sorted == false {
            
            notes = realm.objects(noteData).sorted("favorited", ascending: false)
            tableView.reloadData()
            sorted = true
        } else {
            
            notes = realm.objects(noteData).sorted("favorited", ascending: true)
            tableView.reloadData()
            sorted = false
        }
    }
    
    
    func showCreateNoteModal() {
        
        let makeNoteViewController = MakeNoteViewController()
        makeNoteViewController.modalPresentationStyle = .OverCurrentContext
        self.presentViewController(makeNoteViewController, animated: true, completion: nil)
        
    }
}

