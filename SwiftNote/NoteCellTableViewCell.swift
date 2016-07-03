//
//  NoteCellTableViewCell.swift
//  SwiftNote
//
//  Created by Perris Davis on 6/5/16.
//  Copyright © 2016 Wikipedia Brown. All rights reserved.
//

import UIKit
import IoniconsSwift
import Morgan

class NoteCellTableViewCell: UITableViewCell {
    
    var mainViewController: MainViewController?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: "cellid")
        setupViews()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let noteLabel: UILabel = {
        let label = UILabel()
        label.text = "Sample Note"
        label.textColor = primaryHeaderColor
        label.numberOfLines = 2
        label.font = UIFont.boldSystemFontOfSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(type: .Custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "heart-empty"), forState: UIControlState.Normal)
        
        return button
        
    }()
    
    func setupViews() {
        addSubview(noteLabel)
        addSubview(favoriteButton)
        
        favoriteButton.addTarget(self, action: #selector(NoteCellTableViewCell.handleAction), forControlEvents: .TouchUpInside)
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-16-[v0]-[v1(45)]-8-|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": noteLabel, "v1": favoriteButton]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": noteLabel]))
        
        addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[v0(45)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0": favoriteButton]))
    }
    
    
    func handleAction() {
        
        if let favoritePath = mainViewController!.tableView.indexPathForCell(self) {
            
            try! realm.write {
                if notes![favoritePath.row].favorited == true {
                    favoriteButton.setImage(Ionicons.IosHeart.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
                    notes![favoritePath.row].favorited = false
                    favoriteButton.setImage(Ionicons.IosHeartOutline.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
                    favoriteButton.swing()
                } else {
                    favoriteButton.setImage(Ionicons.IosHeartOutline.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
                    notes![favoritePath.row].favorited = true
                    favoriteButton.setImage(Ionicons.IosHeart.image(35, color: secondaryHeaderColor), forState: UIControlState.Normal)
                    favoriteButton.swing()

                    
                }
            }
        }
    }
}