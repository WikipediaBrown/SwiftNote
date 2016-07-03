//
//  TitleTextField.swift
//  SwiftNote
//
//  Created by Perris Davis on 7/2/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit

class TitleTextField: UITextField {

    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 1, 1)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 1, 1)
    }

}
