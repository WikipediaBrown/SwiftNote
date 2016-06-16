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

        // Do any additional setup after loading the view.
        newTextView.text = notes[note!]
        
        //var characterCount = newTextView.text.characters.count
        
        setupTextView()
        
        let toolBar = UIToolbar()
        toolBar.frame = CGRectMake(0, 500, self.view.frame.size.width, 44)
        toolBar.items = []
        
        self.view.addSubview(toolBar)
        
        
    }

}
