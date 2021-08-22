//
//  TextTableViewCell.swift
//  TossUp
//
//  Created by Carter Burzlaff on 7/16/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class TextTableViewCell: UITableViewCell {
    
    var textField: UITextField!
    var textView: UITextView!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .black
    }
    
    func updateType(type: Support) {
        switch type {
            case .grenade:
                textField = UITextField()
                textField.backgroundColor = .GrayDark
                textField.textColor = .white
                textField.textAlignment = .center
                textField.font = .systemFont(ofSize: 18, weight: .semibold)
                textField.layer.cornerRadius = 5
                textField.delegate = self
                
                contentView.addSubview(textField)
                textField.translatesAutoresizingMaskIntoConstraints = false
                textField.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                textField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                textField.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
                textField.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
            case .feature, .bug:
                textView = UITextView()
                textView.backgroundColor = .GrayDark
                textView.textColor = .white
                textView.textAlignment = .left
                textView.font = .systemFont(ofSize: 18, weight: .bold)
                textView.layer.cornerRadius = 5
                textView.delegate = self
                
                contentView.addSubview(textView)
                textView.translatesAutoresizingMaskIntoConstraints = false
                textView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
                textView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
                textView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 15).isActive = true
                textView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TextTableViewCell: UITextFieldDelegate, UITextViewDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
        }
        return true
    }
}
