//
//  NotesData.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/12/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import Foundation
import RealmSwift
import CoreLocation

class noteData: Object {
    
    dynamic var title = ""
    dynamic var note = ""
    dynamic var favorited = false
    dynamic var createdTime = NSDate()
    dynamic var lastEdited = NSDate()
    dynamic var noteLocation = CLLocation()
}


let realm = try! Realm()

var notes: Results<noteData>?

func preferredStatusBarStyle() -> UIStatusBarStyle {
    return .LightContent
}