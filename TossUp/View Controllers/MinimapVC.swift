//
//  MinimapVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 6/24/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit
import AVKit
import Firebase

class LandscapeAVPlayerViewController: AVPlayerViewController {
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        if UserDefaults.standard.bool(forKey: "av_landscape_only") {
            if UserDefaults.standard.string(forKey: "av_landscape_orientation") == "Right" { return .landscapeRight }
            else { return .landscapeLeft }
        }
        else {
            return .portrait
        }
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UserDefaults.standard.bool(forKey: "av_landscape_only") {
            return .landscape
        }
        else {
            return .all
        }
    }
}

class MinimapVC: UIViewController {
    
    var sc: UISegmentedControl!
    var dropDown: IconSizeDropDown!
    var minimap: UIImageView!
    let backgroundColor: UIColor = .black
    var grenadeArray: [GrenadeButton] = []
    var shownGrenades: [GrenadeButton] = []
    var selectedMap: String = ""
    var selectedMapTitle: String = ""
    var selectedGrenadeType: GrenadeType = .tsmoke
    var selectedGrenadeButton: GrenadeButton!
    var grenadeButtonIsSelected: Bool = false
    var videoIsPlaying: Bool = false
    var ad: GADInterstitial!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setBackButton(iconName: "chevron.left")
        setSettingsButton()
        
        ad = createAndLoadAd()
        
        setGrenadeArray()
        addDropDown()
        setSwipeGestures()
        loadMinimap()
        loadSegmentedControl()
        addTapGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey: "premium") {
            if videoIsPlaying {
                print("showing interstitial ad")
                if ad.isReady { ad.present(fromRootViewController: self) }
                else { print("ad was not ready in time") }
                videoIsPlaying = false
            }
        }
    }
    
    private func createAndLoadAd() -> GADInterstitial {
        let ad = GADInterstitial(adUnitID: interstitialAdID)
        ad.delegate = self
        ad.load(GADRequest())
        return ad
    }
        
    private func addTapGesture() {
        view.backgroundColor = backgroundColor
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
    }
    
    private func setSwipeGestures() {
        let swipeableView = UIView()
        view.addSubview(swipeableView)
        swipeableView.translatesAutoresizingMaskIntoConstraints = false
        swipeableView.topAnchor.constraint(equalTo: dropDown.bottomAnchor).isActive = true
        swipeableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        swipeableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        swipeableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        
        addSwipeGestures(swipeableView)
    }
    
    private func loadMinimap() {
        minimap = UIImageView()
        minimap.image = UIImage(named: selectedMap + "_Minimap")
        view.addSubview(minimap)
        
        minimap.translatesAutoresizingMaskIntoConstraints = false
        minimap.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        minimap.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        minimap.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        minimap.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        
        showButtons(selectedGrenadeType)
    }
    
    private func loadSegmentedControl() {
        let items = ["Smoke", "Fire"]
        
        sc = UISegmentedControl(items: items)
        sc.addTarget(self, action: #selector(newGrenadeSelected), for: .valueChanged)
        sc.apportionsSegmentWidthsByContent = true
        sc.selectedSegmentIndex = 0
        sc.layer.cornerRadius = 3
        
        sc.backgroundColor = .GrayMedium
        sc.selectedSegmentTintColor = .GrayLight
        sc.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)

        let size = CGSize(width: 35, height: 35)
        
        let rawSmoke = UIImage(named: "TSmoke_Icon")
        let rawFire = UIImage(named: "Fire_Icon")
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        UIGraphicsBeginImageContext(size)
        rawSmoke?.draw(in: rect)
        let smoke = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIGraphicsBeginImageContext(size)
        rawFire?.draw(in: rect)
        let fire = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        sc.setImage(smoke, forSegmentAt: 0)
        sc.setImage(fire, forSegmentAt: 1)
        
        self.navigationItem.titleView = sc
    }
    
    private func addDropDown() {
        dropDown = IconSizeDropDown()
        
        view.addSubview(dropDown)
        
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        dropDown.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        dropDown.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        dropDown.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        dropDown.heightAnchor.constraint(equalToConstant: 75).isActive = true
    }
    
    private func setGrenadeArray() {
        if selectedMap == "Dust2" {
            grenadeArray = GrenadeButton.dust2
        }
        else if selectedMap == "Mirage" {
            grenadeArray = GrenadeButton.mirage
        }
        else if selectedMap == "Inferno" {
            grenadeArray = GrenadeButton.inferno
        }
        else if selectedMap == "Cache" {
            grenadeArray = GrenadeButton.cache
        }
        else if selectedMap == "Overpass" {
            grenadeArray = GrenadeButton.overpass
        }
        else if selectedMap == "Train" {
            grenadeArray = GrenadeButton.train
        }
        else if selectedMap == "Nuke" {
            grenadeArray = GrenadeButton.nuke
        }
        else if selectedMap == "Vertigo" {
            grenadeArray = GrenadeButton.vertigo
        }
    }
    
    private func showButtons(_ newGrenade: GrenadeType) {
        var newNades = [newGrenade]
        if newGrenade == .tsmoke { newNades.append(.ctsmoke) }
        
        for nade in shownGrenades {
            nade.removeFromSuperview()
        }
        shownGrenades = []
        for nade in grenadeArray {
            if newNades.contains(nade.type) {
                addNadeToContainer(nade)
                shownGrenades.append(nade)
            }
        }
    }
    
    private func refreshNades() {
        for nade in shownGrenades {
            nade.removeFromSuperview()
        }
        for nade in shownGrenades {
            addNadeToContainer(nade)
        }
    }
    
    private func addNadeToContainer(_ nade: GrenadeButton) {
        view.addSubview(nade)
        
        var size: CGFloat
        switch UserDefaults.standard.integer(forKey: "icon_size") {
            case 1: size = 0.045
            case 2: size = 0.05
            case 3: size = 0.055
            case 4: size = 0.06
            case 5: size = 0.065
            case 6: size = 0.07
            case 7: size = 0.075
            case 8: size = 0.08
            case 9: size = 0.085
            default: size = 0.065
        }
        
        nade.translatesAutoresizingMaskIntoConstraints = false
        nade.centerYAnchor.constraint(equalTo: minimap.topAnchor, constant: nade.yMult * view.frame.width).isActive = true
        nade.centerXAnchor.constraint(equalTo: minimap.leftAnchor, constant: nade.xMult * view.frame.width).isActive = true
        nade.widthAnchor.constraint(equalTo: minimap.widthAnchor, multiplier: size).isActive = true
        nade.heightAnchor.constraint(equalTo: minimap.heightAnchor, multiplier: size).isActive = true
    }
    
    @objc func newGrenadeSelected(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
            case 0: selectedGrenadeType = .tsmoke
            case 1: selectedGrenadeType = .fire
            case 2: selectedGrenadeType = .flashbang
            case 3: selectedGrenadeType = .he
            default: selectedGrenadeType = .tsmoke
        }
        showButtons(selectedGrenadeType)
    }
    
    @objc func grenadeButtonPressed(_ sender: GrenadeButton) {
        selectedGrenadeButton = sender
        grenadeButtonIsSelected = true
        for nade in shownGrenades {
            if nade != sender {
                nade.removeFromSuperview()
            }
        }
        shownGrenades = [sender]
        for target in sender.targetArray {
            addNadeToContainer(target)
            shownGrenades.append(target)
        }
    }
    
    @objc func targetButtonPressed(_ sender: GrenadeButton) {
        //let player = AVPlayer(url: URL(string: sender.url)!)
        let url = "\(awsURLPrefix)\(selectedMap.lowercased())/\(selectedMap.lowercased())_\(selectedGrenadeType.description)_\(selectedGrenadeButton.location!)_from_\(sender.location!).mp4"
        let player = AVPlayer(url: URL(string: url)!)
        let vc = LandscapeAVPlayerViewController()
        vc.player = player
        
        present(vc, animated: true) {
            if UserDefaults.standard.bool(forKey: "av_player_autoplay") {
                vc.player?.play()
            }
            self.addWatermark(vc)
        }
        
        videoIsPlaying = true
        Analytics.logEvent("video_watched", parameters: ["map": selectedMapTitle, "target_pressed": "\(selectedMap)_\(selectedGrenadeType)_\(selectedGrenadeButton.location ?? " ")_from_\(sender.location ?? "")"])
    }
            
    private func addWatermark(_ vc: LandscapeAVPlayerViewController) {
        let watermark = UIImageView(image: UIImage(named: "TossUp_Logo_White"))
        watermark.layer.opacity = 0.3
        vc.contentOverlayView?.addSubview(watermark)
        let screenHeight = vc.contentOverlayView?.frame.height
        let watermarkHeight = screenHeight! * 0.07 // 0.075
        watermark.translatesAutoresizingMaskIntoConstraints = false
        watermark.centerXAnchor.constraint(equalTo: vc.contentOverlayView!.centerXAnchor).isActive = true
        watermark.bottomAnchor.constraint(equalTo: vc.contentOverlayView!.bottomAnchor, constant: -25).isActive = true
        watermark.heightAnchor.constraint(equalToConstant: watermarkHeight).isActive = true
        watermark.widthAnchor.constraint(equalToConstant: watermarkHeight * 7/2).isActive = true
    }
    
    @objc func viewTapped(_ sender: UITapGestureRecognizer) {
        if grenadeButtonIsSelected == true {
            showButtons(selectedGrenadeType)
            grenadeButtonIsSelected = false
        }
    }
    
    @objc func sliderValueChanged(_ sender: UISlider) {
        sender.value = roundf(sender.value)
        
        if UserDefaults.standard.object(forKey: "icon_size") as! Float != sender.value {
            UserDefaults.standard.set(sender.value, forKey: "icon_size")
            refreshNades()
        }
    }
}

extension MinimapVC: GADInterstitialDelegate {
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        self.ad = createAndLoadAd()
    }
    func interstitial(_ ad: GADInterstitial, didFailToReceiveAdWithError error: GADRequestError) {
        print(error)
        Analytics.logEvent("error_receiving_ad", parameters: ["error_description": error.description])
    }
}
