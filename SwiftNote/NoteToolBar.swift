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
        
        let newButton = UIBarButtonItem(title: "Save", style: UIBarButtonItemStyle.Plain, target: NoteTemplateViewController.self, action: #selector(NoteTemplateViewController.saveNote))
        
        toolBar.items = [spacer, newButton]
        
        return toolBar
    }
    
    func test() {}
}