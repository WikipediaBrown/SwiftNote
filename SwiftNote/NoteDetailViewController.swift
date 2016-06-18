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
}
