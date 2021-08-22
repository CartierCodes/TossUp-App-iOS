//
//  SettingsTableViewCell.swift
//  TossUp
//
//  Created by Carter Burzlaff on 7/15/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {
    
    var icon: UIImageView
    var label: UILabel
    var arrow: UIImageView
    var toggle: UISwitch
    var side: UILabel
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        icon = UIImageView()
        label = UILabel()
        arrow = UIImageView(image: UIImage(systemName: "chevron.right")?.withTintColor(.white, renderingMode: .alwaysOriginal))
        toggle = UISwitch()
        side = UILabel()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .GrayDark
        
        icon.contentMode = .scaleAspectFit
        
        label.font = UIFont(name: "OpenSans-SemiBold", size: 15.5)
        label.textColor = .white
        
        side.font = UIFont(name: "OpenSans-SemiBold", size: 15.5)
        side.textColor = .white
        
        toggle.onTintColor = .Gold
        
        contentView.addSubview(icon)
        contentView.addSubview(label)
        contentView.addSubview(arrow)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        icon.centerXAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20).isActive = true
        icon.widthAnchor.constraint(equalToConstant: contentView.frame.height * 0.5).isActive = true
        icon.heightAnchor.constraint(equalTo: icon.widthAnchor).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: icon.centerXAnchor, constant: 20).isActive = true
        
        arrow.translatesAutoresizingMaskIntoConstraints = false
        arrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        arrow.centerXAnchor.constraint(equalTo: contentView.rightAnchor, constant: -23).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToggle(type: Video) {
        arrow.removeFromSuperview()
        
        switch type {
            case .autoplay:
                toggle.addTarget(self, action: #selector(autoplayUpdated), for: .valueChanged)
                toggle.isOn = UserDefaults.standard.bool(forKey: "av_player_autoplay")
            case .landscapeOnly:
                toggle.addTarget(self, action: #selector(landscapeOnlyUpdated), for: .valueChanged)
                toggle.isOn = UserDefaults.standard.bool(forKey: "av_landscape_only")
            default: break
        }
        
        contentView.addSubview(toggle)
        toggle.translatesAutoresizingMaskIntoConstraints = false
        toggle.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        toggle.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
    }
    
    func addSideLabel(type: Video) {
        arrow.removeFromSuperview()
        
        switch type {
            case .landscapeStart:
                side.text = UserDefaults.standard.string(forKey: "av_landscape_orientation")
            default: break
        }
        
        contentView.addSubview(side)
        side.translatesAutoresizingMaskIntoConstraints = false
        side.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        side.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
    }
    
    @objc func autoplayUpdated(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "av_player_autoplay")
    }
    
    @objc func landscapeOnlyUpdated(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: "av_landscape_only")
    }
}

