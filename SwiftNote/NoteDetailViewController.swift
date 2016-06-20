//
//  NoteDetailViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/14/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class NoteDetailViewController: NoteTemplateViewController, UINavigationControllerDelegate {
    
    var selectedRow: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView()
        newTextView.text = notes![selectedRow!].note
        
        if selectedRow != nil {
            let noteList = notes![selectedRow!]
            newTextView.text = noteList.note
            isFav = noteList.favorited
            //getFavButtonState()
        }
    }
    
    override func saveNote() {
        
        if newTextView.text != "" {
            
            try! realm.write {
                
                notes![selectedRow!].note = newTextView.text
                notes![selectedRow!].lastEdited = NSDate() 
            }
        } else {
            
            try! realm.write {
                
                realm.delete(notes![selectedRow!])
            }
            
        }
        
        notes![selectedRow!].favorited = isFav

        
        self.navigationController?.popViewControllerAnimated(true)
    }
}
