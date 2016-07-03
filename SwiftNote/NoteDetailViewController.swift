//
//  NoteDetailViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/14/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import IoniconsSwift

class NoteDetailViewController: NoteTemplateViewController, UINavigationControllerDelegate {
    
    var selectedRow: Int?
    var selectedRowTitle: String?
    var selectedRowNote: String?
    var selectedRowFavorited: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView()
        newTextField.text = selectedRowTitle
        newTextView.text = selectedRowNote
        isFav = selectedRowFavorited!
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: Ionicons.ArrowLeftC.image(35), style: .Plain, target: self, action: #selector(backButton))
        
        //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Delete", style: .Plain, target: self, action: #selector(deleteButton))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: Ionicons.IosTrashOutline.image(35), style: .Plain, target: self, action: #selector(deleteButton))
        navigationItem.rightBarButtonItem?.tintColor = UIColor.redColor()
    }
    
    override func saveNote() {
                    
            try! realm.write {
                
                notes![selectedRow!].title = newTextField.text!
                notes![selectedRow!].note = newTextView.text
                notes![selectedRow!].lastEdited = NSDate()
                notes![selectedRow!].favorited = isFav
            }
      
        
        headerText()
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func backButton() {
    
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    func deleteButton() {
        
        func customAlertTitle() -> NSAttributedString {
            
            let textAttributes = [
                NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),
                NSForegroundColorAttributeName: UIColor.redColor()
            ]
            let alert = NSMutableAttributedString(string: "Delete this note?", attributes: textAttributes)
            return alert
        }
        
        func customAlertBody() -> NSAttributedString {
            
            let textAttributes = [
                NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),
                NSForegroundColorAttributeName: primaryHeaderColor
            ]
            let alert = NSMutableAttributedString(string: "Are you sure you want to delete this note. This cannot be undone.", attributes: textAttributes)
            return alert
        }
        
        func customActionText() -> NSAttributedString {
            
            let textAttributes = [
                NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline),
                NSForegroundColorAttributeName: primaryHeaderColor
            ]
            let alert = NSMutableAttributedString(string: "Delete", attributes: textAttributes)
            return alert
        }
        
        let deleteConfirmation = UIAlertController(title: "", message: "", preferredStyle: .ActionSheet)
        
        deleteConfirmation.setValue(customAlertTitle(), forKey: "attributedTitle")
        deleteConfirmation.setValue(customAlertBody(), forKey: "attributedMessage")
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil)
        deleteConfirmation.addAction(cancelAction)
        
        let deleteAction = UIAlertAction(title: "Delete", style: .Destructive) { action in
            
            try! realm.write {
                
                realm.delete(notes![self.selectedRow!])
            }
            self.headerText()
            self.navigationController?.popViewControllerAnimated(true)
            
        }
        deleteConfirmation.addAction(deleteAction)
        deleteConfirmation.view.tintColor = primaryHeaderColor
        
        
        
        presentViewController(deleteConfirmation, animated: true, completion: {
            
            deleteConfirmation.view.tintColor = primaryHeaderColor
        })
        
    }
}