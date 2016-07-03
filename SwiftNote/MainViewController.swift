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
import Morgan

//------------------------------------------------------------
class MainViewController: UITableViewController {
    
    //------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------------------------------------------
        self.navigationController?.navigationBar.hidden = false
        //------------------------------------------------------------

        //------------------------------------------------------------
        navigationItem.title = "TwiceCream"
        //------------------------------------------------------------
        
        //navigationItem.backBarButtonItem = Ionicons.ChevronLeft.label(35)
        
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
    
    override func viewWillAppear(animated: Bool) {
        notes = realm.objects(noteData)


        tableView.reloadData()
    }
    //------------------------------------------------------------
    func reloadTableData(notification: NSNotification) {
        
        tableView.reloadData()
    }
    //------------------------------------------------------------
    
    
    // This creates an attributed string for the UITableViewCells
//------------------------------------------------------------
    func makeAttributedString(title title: String, date: NSDate) -> NSAttributedString {
        
        let dateFormatter = NSDateFormatter()
        let timeFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM d"
        timeFormatter.dateFormat = "h:m:ss a"
        let underText = "\(dateFormatter.stringFromDate(date)) at \(timeFormatter.stringFromDate(date))"
        
        
        
        let titleAttributes = [
            NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),
            NSForegroundColorAttributeName: primaryHeaderColor

        ]
        
        let subtitleAttributes = [
            NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote),
            NSForegroundColorAttributeName: accentColor
        ]
        
        let titleString = NSMutableAttributedString(string: "\(title)\n", attributes: titleAttributes)
        let subtitleString = NSAttributedString(string: "\(underText)", attributes: subtitleAttributes)
        
        titleString.appendAttributedString(subtitleString)
        
        return titleString
    }
//------------------------------------------------------------
    
    
    
    // These are the delegate methods required for the tableView
//------------------------------------------------------------
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return notes!.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let noteCell = tableView.dequeueReusableCellWithIdentifier("cellId", forIndexPath: indexPath) as! NoteCellTableViewCell
        
        noteCell.noteLabel.attributedText = makeAttributedString(title: notes![indexPath.row].title, date: notes![indexPath.row].createdTime)
            //notes![indexPath.row].note
        
        
        if notes![indexPath.row].favorited == true {
            
            noteCell.favoriteButton.setImage(Ionicons.IosHeart.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
        } else {
            
            noteCell.favoriteButton.setImage(Ionicons.IosHeartOutline.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
        }
        noteCell.mainViewController = self
        return noteCell
    }
//------------------------------------------------------------

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let noteDetailViewController = NoteDetailViewController()
        noteDetailViewController.selectedRow = indexPath.row
        noteDetailViewController.selectedRowTitle = notes![indexPath.row].title
        noteDetailViewController.selectedRowNote = notes![indexPath.row].note
        noteDetailViewController.selectedRowFavorited = notes![indexPath.row].favorited
        self.navigationController?.pushViewController(noteDetailViewController, animated: true)
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerCell = tableView.dequeueReusableHeaderFooterViewWithIdentifier("headerId")
        
        return headerCell
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
            noteCount.text = "You've got \(notes!.count) notes saved"
            noteCount.shake()
            NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        }
        swipeShare.backgroundColor = primaryTranslucentColor
        return [swipeDelete, swipeShare]
    }
    //------------------------------------------------------------
    
    //------------------------------------------------------------
    var sorted = false
    
    func sortNoteTable() {
        
        
        if sorted == false {
            
            notes = realm.objects(noteData).sorted("favorited", ascending: false)
            tableView.reloadData()
            sorted = true
        } else {
            
            notes = realm.objects(noteData).sorted("lastEdited", ascending: false)
            tableView.reloadData()
            sorted = false
        }
    }
    //------------------------------------------------------------
    
    //------------------------------------------------------------
    
    func showCreateNoteModal() {
        
        let makeNoteViewController = MakeNoteViewController()
        makeNoteViewController.modalPresentationStyle = .OverCurrentContext
        self.presentViewController(makeNoteViewController, animated: true, completion: nil)
        
    }
    //------------------------------------------------------------
    
}

