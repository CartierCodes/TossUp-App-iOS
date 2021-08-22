//
//  MapSelectionVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 6/16/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit
import Firebase
import AdSupport

class MapSelectionVC: UIViewController {
    
    var collection: UICollectionView!
    let backgroundColor: UIColor = .GrayUltraDark
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setNavBarStyle()
        setSettingsButton()
        setTitleImage()
        
        addSwipeGestures(view)
        setupCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //empty
    }
        
    private func setTitleImage() {
        let bannerHeight = (navigationController?.navigationBar.frame.size.height)!
        let height = bannerHeight - 22
        
        let view = UIView(frame: CGRect(x: 0, y: 2, width: height * 7/2, height: height))
        let logo = UIImageView(image: UIImage(named: "TossUp_Logo"))
        logo.frame = view.frame

        view.addSubview(logo)
        navigationItem.titleView = view
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        let padding: CGFloat = 10
        var columns: CGFloat = 2
        if UIDevice.current.userInterfaceIdiom == .pad { columns = 3 }
        let totalPadding: CGFloat = (2 * padding) + ((columns - 1) *  (2 * padding))
        let itemSize: CGFloat = (view.frame.width - totalPadding) / columns
        
        layout.itemSize = CGSize(width: itemSize, height: itemSize)
        layout.sectionInset = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
//        layout.minimumLineSpacing = padding
//        layout.minimumInteritemSpacing = padding
        
        collection = UICollectionView(frame: view.frame, collectionViewLayout: layout)
        collection.register(MapCollectionViewCell.self, forCellWithReuseIdentifier: "MapCollectionViewCell")
        collection.backgroundColor = backgroundColor
        collection.delegate = self
        collection.dataSource = self
        
        view.addSubview(collection)
    }
}

extension MapSelectionVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return maps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCollectionViewCell", for: indexPath) as! MapCollectionViewCell
        cell.logo.image = UIImage(named: maps[indexPath.item].replacingOccurrences(of: " ", with: "") + "_Logo")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = MinimapVC()
        
        vc.selectedMap = maps[indexPath.item].replacingOccurrences(of: " ", with: "")
        vc.selectedMapTitle = maps[indexPath.item]
        setNextVC(vc)
        navigationController?.pushViewController(vc, animated: true)
    }
}
