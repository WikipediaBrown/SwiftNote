//
//  MakeNoteViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class MakeNoteViewController: NoteTemplateViewController {
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupNavBar()
    }
    
    // This method is called when the left navBar button is pressed.
    //func leftNavBarButton() {}
    
    // This method is called when the right navBar button is pressed.
    func rightNavBarButton() {
        
        self.dismissViewControllerAnimated(true) {
            
        }
    }
    
    override func favoriteNote() {
        if noteIsFavorited == false {
        
            noteIsFavorited = true
            print(noteIsFavorited)
            
            self.inputAccessoryViewController?.reloadInputViews()
        } else {
        
            noteIsFavorited = false
            print(noteIsFavorited)
            
            self.inputAccessoryViewController?.reloadInputViews()


        }
        
    }
    
    
    
    
    override func saveNote() {
        
        if newTextView.text != "" {
            
            let newNoteToSave = noteData()
            newNoteToSave.note = newTextView.text
            
            try! realm.write {
                
                realm.add(newNoteToSave)
            }
            
            
            NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        }
        
        self.dismissViewControllerAnimated(true) {
            
        }
    }
}
