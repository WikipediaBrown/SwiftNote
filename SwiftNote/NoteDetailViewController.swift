//
//  NoteDetailViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/14/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class NoteDetailViewController: NoteTemplateViewController, UINavigationControllerDelegate {
    
    var note: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextView()
        newTextView.text = notes[note!]
    }
    
    override func saveNote() {
        
        self.navigationController?.popViewControllerAnimated(true)
        if newTextView.text != "" {
            
            notes[note!] = newTextView.text
            NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)

        } else {
            
            notes.removeAtIndex(note!)
            NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        }
    }
}
