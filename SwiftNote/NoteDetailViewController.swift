//
//  NoteDetailViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/14/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class NoteDetailViewController: MakeNoteViewController, UINavigationControllerDelegate, UIToolbarDelegate {
    
    var note: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        newTextView.text = notes[note!]
        
        //var characterCount = newTextView.text.characters.count
        
        
        let toolBar = UIToolbar()
        toolBar.frame = CGRectMake(0, 0, self.view.frame.size.width, 44)
        toolBar.items = []
        
        

        self.view.addSubview(toolBar)
        
        
    }

    
    
    

}
