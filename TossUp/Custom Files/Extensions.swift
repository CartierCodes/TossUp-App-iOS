//
//  Extensions.swift
//  TossUp
//
//  Created by Carter Burzlaff on 7/15/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

extension UIColor {
    static let GrayUltraDark = UIColor(red: 0.1, green: 0.1, blue: 0.1, alpha: 1.0)
    static let GrayDark = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0)
    static let GrayMedium = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1.0)
    static let GrayNormal = UIColor(red: 0.25, green: 0.25, blue: 0.25, alpha: 1.0)
    static let GrayLight = UIColor(red: 0.4, green: 0.4, blue: 0.4, alpha: 1.0)
    static let GrayUltraLight = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
    static let Gold = UIColor(red: 1.0, green: 0.68, blue: 0, alpha: 1.0)
}

extension UIViewController {
    func setNavBarStyle() {
        navigationController?.navigationBar.barTintColor = .GrayDark
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.isTranslucent = false
    }
    
    func setBackButton(iconName: String) {
        var size: CGFloat = 16
        if iconName == "xmark" { size = 14 }
        
        let backButton = UIBarButtonItem(image: UIImage(systemName: iconName, withConfiguration: UIImage.SymbolConfiguration(pointSize: size, weight: .regular))?.withTintColor(.Gold, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(backButtonPressed))
        
        navigationItem.leftBarButtonItem = backButton
    }
        
    func setTitleLabel(title: String) {
        navigationItem.title = title
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont(name: titleFont, size: titleSize)!]
    }
    
    func setSettingsButton() {
        let settingsButton = UIBarButtonItem(image: UIImage(systemName: "slider.horizontal.3", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .regular))?.withTintColor(.Gold, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(settingsButtonPressed))
        
        navigationItem.rightBarButtonItem = settingsButton
    }
    
    func createTitleView(title: String) -> UIView {
        let titleView = UIView()
        titleView.backgroundColor = .GrayDark
        
        let label = UILabel()
        label.font = UIFont(name: titleFont, size: titleSize)
        label.textColor = .white
        label.text = title
        
        let exit = UIButton()
        exit.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17, weight: .regular))?.withTintColor(.Gold, renderingMode: .alwaysOriginal), for: .normal)
        exit.addTarget(UIViewController(), action: #selector(UIViewController.exitButtonPressed), for: .touchUpInside)
        
        titleView.addSubview(exit)
        titleView.addSubview(label)
        
        exit.translatesAutoresizingMaskIntoConstraints = false
        exit.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        exit.centerXAnchor.constraint(equalTo: titleView.leftAnchor, constant: 23).isActive = true
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: titleView.centerXAnchor).isActive = true
        
        view.addSubview(titleView)
        
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        titleView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        titleView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        return titleView
    }
    
    func createTableViewFooter(_ text: String, _ height: CGFloat, _ color: UIColor) -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: height))
        footerView.backgroundColor = color
        
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-SemiBold", size: 16.5)
        label.textColor = .GrayLight
        label.text = text
        
        footerView.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        return footerView
    }
    
    func addSwipeGestures(_ view: UIView) {
        let leftSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade))
        leftSwipeRecognizer.direction = .left
        let rightSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeMade))
        rightSwipeRecognizer.direction = .right
        view.addGestureRecognizer(leftSwipeRecognizer)
        view.addGestureRecognizer(rightSwipeRecognizer)
    }
    
    func setNextVC(_ vc: UIViewController) {
        nextVC = vc
    }
        
    @objc func settingsButtonPressed(_ sender: UIButton) {
        let vc = SettingsVC()
        setNextVC(vc)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func backButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func exitButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func swipeMade(_ sender: UISwipeGestureRecognizer) {
        if sender.direction == .left {
            if nextVC != self && nextVC != nil { navigationController?.pushViewController(nextVC!, animated: true) }
        }
        if sender.direction == .right {
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func selectedNonTextField() {
        view.endEditing(true)
    }
}
