//
//  MapCollectionViewCell.swift
//  TossUp
//
//  Created by Carter Burzlaff on 7/5/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class MapCollectionViewCell: UICollectionViewCell {
    
    var logo: UIImageView
    
    override init(frame: CGRect) {
        logo = UIImageView()
        super.init(frame: frame)
        
        logo.frame = contentView.frame
        logo.contentMode = .scaleAspectFit
        layer.cornerRadius = 25
        backgroundColor = .GrayUltraDark
        contentView.addSubview(logo)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
