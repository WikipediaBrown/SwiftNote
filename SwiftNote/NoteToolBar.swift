//
//  Helper.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/16/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import Foundation
import UIKit

struct NoteToolBar {
    static func createToolBarWithTarget(target: AnyObject, width: CGFloat) -> UIToolbar {
        
        let toolBar = UIToolbar(frame: CGRectMake(0, 0, width, 44))        
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        let favoriteButton = UIBarButtonItem(image: UIImage(named: "heart-empty"), style: .Plain, target: target, action: #selector(NoteTemplateViewController.favoriteNote))
        
        let saveButton = UIBarButtonItem(title: "Save", style: .Plain, target: target, action: #selector(NoteTemplateViewController.saveNote))
        
        toolBar.items = [favoriteButton, spacer, saveButton]
        
        
        
        return toolBar
    }
}