//
//  NoteDetailViewController.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/14/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class NoteDetailViewController: MakeNoteViewController, UINavigationControllerDelegate {
    
    var note: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupViews()
        newTextView.text = notes[note!]
        
        let toolBar = UIToolbar()
        
        self.view.addSubview(toolBar)
        
        
    }

    
    
    

}
