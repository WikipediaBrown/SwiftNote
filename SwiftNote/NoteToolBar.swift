//
//  Helper.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/16/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import Foundation
import UIKit
import IoniconsSwift
import Hue

struct NoteToolBar {
    static func createToolBarWithTarget(target: AnyObject, width: CGFloat, favorited: Bool, characters: Int) -> UIToolbar {
        
        
        let toolBar = UIToolbar(frame: CGRectMake(0, 0, width, 44))
        
        
        
        let characterCount = UIBarButtonItem()
        characterCount.title = "\(characters)"
        
        
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        let favoriteButton = UIBarButtonItem(image: Ionicons.IosHeartOutline.image(35, color: primaryHeaderColor), style: .Plain, target: target, action: #selector(NoteTemplateViewController.favoriteNote))
        
        let saveButton = UIBarButtonItem(title: "Save", style: .Plain, target: target, action: #selector(NoteTemplateViewController.saveNote))
        
        toolBar.items = [favoriteButton, characterCount, spacer, saveButton]
        
        
        
        return toolBar
    }
}