//
//  IconSizeDropDown.swift
//  TossUp
//
//  Created by Carter Burzlaff on 7/21/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class IconSizeDropDown: UIView {
    
    let mainColor: UIColor = .GrayDark // .GrayMedium
    let roundedEdgeSize: CGFloat = 8
    
    var dropDownView: UIView!
    let dropDownImageView = UIImageView(image: UIImage(systemName: "chevron.down")?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal))
    
    var sliderView: UIView!
    var slider: UISlider!
    
    var pushUpView: UIView!
    let pushUpImageView = UIImageView(image: UIImage(systemName: "chevron.up")?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal))
    
    init() {
        super.init(frame: CGRect.zero)
        
        createAllElements()
        addDropDownToView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createAllElements() {
        createDropDownView()
        createSliderView()
        createPushUpView()
    }
    
    private func createDropDownView() {
        dropDownView = UIView()
        dropDownView.backgroundColor = mainColor
        dropDownView.layer.cornerRadius = roundedEdgeSize
        dropDownView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        dropDownView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dropDownTouched)))
        let downSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(dropDownTouched))
        downSwipeRecognizer.direction = .down
        dropDownView.addGestureRecognizer(downSwipeRecognizer)
        
        dropDownView.addSubview(dropDownImageView)
        dropDownImageView.translatesAutoresizingMaskIntoConstraints = false
        dropDownImageView.centerYAnchor.constraint(equalTo: dropDownView.centerYAnchor).isActive = true
        dropDownImageView.centerXAnchor.constraint(equalTo: dropDownView.centerXAnchor).isActive = true
    }
    
    private func createSliderView() {
        sliderView = UIView()
        sliderView.backgroundColor = mainColor
        
        slider = UISlider()
        slider.addTarget(MinimapVC(), action: #selector(MinimapVC.sliderValueChanged), for: .valueChanged)
        
        slider.minimumValue = 1.0
        slider.maximumValue = 9.0
        slider.value = UserDefaults.standard.object(forKey: "icon_size") as! Float
        
        slider.minimumValueImage = UIImage(systemName: "cloud.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 16, weight: .regular))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        slider.maximumValueImage = UIImage(systemName: "cloud.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24, weight: .regular))?.withTintColor(.white, renderingMode: .alwaysOriginal)
        slider.minimumTrackTintColor = .GrayLight
        
        
        sliderView.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        slider.centerYAnchor.constraint(equalTo: sliderView.centerYAnchor).isActive = true
        slider.heightAnchor.constraint(equalTo: sliderView.safeAreaLayoutGuide.heightAnchor).isActive = true
        if UIDevice.current.userInterfaceIdiom == .pad {
            slider.widthAnchor.constraint(equalToConstant: 600).isActive = true
            slider.centerXAnchor.constraint(equalTo: sliderView.centerXAnchor).isActive = true
        }
        else {
            slider.leftAnchor.constraint(equalTo: sliderView.leftAnchor, constant: 40).isActive = true
            slider.rightAnchor.constraint(equalTo: sliderView.rightAnchor, constant: -32).isActive = true
        }
    }
    
    private func createPushUpView() {
        pushUpView = UIView()
        pushUpView.backgroundColor = mainColor
        pushUpView.layer.cornerRadius = roundedEdgeSize
        pushUpView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        pushUpView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(pushUpTouched)))
        let upSwipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(pushUpTouched))
        upSwipeRecognizer.direction = .up
        pushUpView.addGestureRecognizer(upSwipeRecognizer)
        
        pushUpView.addSubview(pushUpImageView)
        pushUpImageView.translatesAutoresizingMaskIntoConstraints = false
        pushUpImageView.centerYAnchor.constraint(equalTo: pushUpView.centerYAnchor).isActive = true
        pushUpImageView.centerXAnchor.constraint(equalTo: pushUpView.centerXAnchor).isActive = true
    }
    
    private func addDropDownToView() {
        addSubview(dropDownView)
        dropDownView.translatesAutoresizingMaskIntoConstraints = false
        dropDownView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        dropDownView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dropDownView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        dropDownView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    private func addSliderViewToView() {
        addSubview(sliderView)
        sliderView.translatesAutoresizingMaskIntoConstraints = false
        sliderView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        sliderView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
        sliderView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        sliderView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        addSubview(pushUpView)
        pushUpView.translatesAutoresizingMaskIntoConstraints = false
        pushUpView.topAnchor.constraint(equalTo: sliderView.bottomAnchor).isActive = true
        pushUpView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        pushUpView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        pushUpView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    @objc func dropDownTouched(_ sender: UIView) {
        dropDownView.removeFromSuperview()
        addSliderViewToView()
    }
    
    @objc func pushUpTouched(_ sender: UIView) {
        sliderView.removeFromSuperview()
        pushUpView.removeFromSuperview()
        addDropDownToView()
    }
}
