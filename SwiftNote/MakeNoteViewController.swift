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
            
            self.addNote()
            
            
        }
    }
    
    public func addNote() {
        
        if newTextView.text != "" {
            notes.append(newTextView.text)
            NSNotificationCenter.defaultCenter().postNotificationName("reload", object: nil)
        }
    }
    
}
