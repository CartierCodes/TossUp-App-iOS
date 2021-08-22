//
//  ThrowButton.swift
//  TossUp
//
//  Created by Carter Burzlaff on 6/23/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class ThrowButton: UIButton {
    
    let location: String?
    
    override init(frame: CGRect) {
        location = nil
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        location = nil
        super.init(coder: coder)
        setupButton()
    }
    
    
    init(location: String, view: UIView, x: CGFloat, y: CGFloat) {
        self.location = location
        super.init(frame: CGRect(x: x, y: y, width: view.frame.width * 0.05, height: view.frame.width * 0.05))
        setupButton()
    }
    
    private func setupButton() {
        //backgroundColor = .white
        
        setImage(UIImage(named: "Target_Icon"), for: .normal)
    }
}
