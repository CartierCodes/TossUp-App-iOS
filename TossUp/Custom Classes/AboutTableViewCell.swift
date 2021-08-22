//
//  AboutTableViewCell.swift
//  TossUp
//
//  Created by Carter Burzlaff on 8/19/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {
    
    var label: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        label = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .GrayDark
        
        label.font = UIFont(name: "OpenSans-SemiBold", size: 15)
        label.textAlignment = .left
        label.textColor = .GrayUltraLight
        label.numberOfLines = 0
        
        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        label.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
        label.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

