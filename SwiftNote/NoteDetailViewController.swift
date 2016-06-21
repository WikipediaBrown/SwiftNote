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
    var selectedRowNote: String?
    var selectedRowFavorited: Bool?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView()
        newTextView.text = selectedRowNote
        if selectedRowNote != nil {
            
            newTextView.text = selectedRowNote
            isFav = selectedRowFavorited!
        }
    }
    
    override func saveNote() {
        
        if newTextView.text != "" {
            
            try! realm.write {
                
                notes![selectedRow!].note = newTextView.text
                notes![selectedRow!].lastEdited = NSDate()
                notes![selectedRow!].favorited = isFav
                
            }
        } else {
            
            try! realm.write {
                
                realm.delete(notes![selectedRow!])
                noteCount.shake()
            }
            
        }
        

        headerText()
        NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        self.navigationController?.popViewControllerAnimated(true)
    }
}
