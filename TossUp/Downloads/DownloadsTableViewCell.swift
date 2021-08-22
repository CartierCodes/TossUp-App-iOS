//
//  DownloadsTableViewCell.swift
//  TossUp
//
//  Created by Carter Burzlaff on 10/10/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class DownloadsTableViewCell: UITableViewCell {
    
    var mapLabel: UILabel
    var sizeLabel: UILabel
    var downloadButton: UIButton
    var progressBar: UIProgressView
    var activityIndicator: UIActivityIndicatorView
    var map: String!
    var downloadRequest: NSBundleResourceRequest!
    var mapUserDefaultString: String!
    var downloadingResources = false
    var delegate: UIViewController!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        mapLabel = UILabel()
        sizeLabel = UILabel()
        downloadButton = UIButton()
        progressBar = UIProgressView()
        activityIndicator = UIActivityIndicatorView()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.backgroundColor = .GrayDark
        
        addMapLabel()
        addDownloadButton()
        addSizeLabel()
    }
    
    private func addMapLabel() {
        mapLabel.font = UIFont(name: "OpenSans-SemiBold", size: 15.5)
        mapLabel.textColor = .white
        mapLabel.textAlignment = .left
        
        contentView.addSubview(mapLabel)
        mapLabel.translatesAutoresizingMaskIntoConstraints = false
        mapLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        mapLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 10).isActive = true
    }
    
    private func addDownloadButton() {
        downloadButton.setImage(UIImage(systemName: "icloud.and.arrow.down.fill")?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal), for: .normal)
        downloadButton.addTarget(self, action: #selector(downloadButtonTapped), for: .touchUpInside)
        
        contentView.addSubview(downloadButton)
        downloadButton.translatesAutoresizingMaskIntoConstraints = false
        downloadButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        downloadButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        downloadButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -15).isActive = true
        downloadButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
    }
        
    private func addSizeLabel() {
        sizeLabel.font = UIFont(name: "OpenSans-SemiBold", size: 15.5)
        sizeLabel.textColor = .GrayLight
        //sizeLabel.textAlignment = .left
        
        contentView.addSubview(sizeLabel)
        sizeLabel.translatesAutoresizingMaskIntoConstraints = false
        sizeLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        sizeLabel.rightAnchor.constraint(equalTo: downloadButton.leftAnchor, constant: -15).isActive = true
    }
    
    private func addProgressBarAndWheel() {
        progressBar.observedProgress = downloadRequest.progress
        progressBar.progressTintColor = .white
        progressBar.trackTintColor = .GrayLight
        contentView.addSubview(progressBar)
        progressBar.translatesAutoresizingMaskIntoConstraints = false
        progressBar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        progressBar.rightAnchor.constraint(equalTo: sizeLabel.leftAnchor, constant: -15).isActive = true
        progressBar.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        contentView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        activityIndicator.rightAnchor.constraint(equalTo: progressBar.leftAnchor, constant: -15).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setDownloadButtonToX() {
        sizeLabel.textColor = .white
        downloadButton.setImage(UIImage(systemName: "xmark.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    private func setDownloadButtonToCloud() {
        sizeLabel.textColor = .GrayLight
        downloadButton.setImage(UIImage(systemName: "icloud.and.arrow.down.fill")?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal), for: .normal)
    }
    
    func setMap(_ map: String) {
        self.map = map
        mapUserDefaultString = map.lowercased().replacingOccurrences(of: " ", with: "") + "_downloaded"
        
        if UserDefaults.standard.bool(forKey: mapUserDefaultString) {
            setDownloadButtonToX()
        }
    }
    
    @objc func downloadButtonTapped(_ sender: UIButton) {
        downloadRequest = NSBundleResourceRequest(tags: mapAssetsTag(map))
        self.downloadRequest.conditionallyBeginAccessingResources(completionHandler: {(resourcesAvailable: Bool) -> Void in
            if resourcesAvailable || self.downloadingResources {
                DispatchQueue.main.async {
                    let removeAlert = UIAlertController(title: "Delete \(self.map!) Assets?", message: "Are you sure you want to delete the assets for \(self.map!)?", preferredStyle: .alert)
                    removeAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
                        print("confirming the removal of assets")
                        self.downloadRequest.endAccessingResources()
                        self.setDownloadButtonToCloud()
                        UserDefaults.standard.setValue(false, forKey: self.mapUserDefaultString)
                    }))
                    removeAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                        print("cancelling the removal of assets")
                    }))
                    
                    self.delegate.present(removeAlert, animated: true)
                }
            }
            else {
                DispatchQueue.main.async {
                    let downloadAlert = UIAlertController(title: "Download \(self.map!) Assets?", message: "Are you sure you want to download the assets for \(self.map!)?", preferredStyle: .alert)
                    downloadAlert.addAction(UIAlertAction(title: "Confirm", style: .default, handler: { (action: UIAlertAction!) in
                        print("confirming the download of assets")
                        self.downloadRequest.beginAccessingResources { (error: Error?) in
                            if let error = error {
                                print(error)
                                self.downloadRequest.endAccessingResources()
                                UserDefaults.standard.setValue(false, forKey: self.mapUserDefaultString)
                                return
                            }
                            OperationQueue.main.addOperation {
                                self.progressBar.removeFromSuperview()
                                self.activityIndicator.stopAnimating()
                                self.setDownloadButtonToX()
                                UserDefaults.standard.setValue(true, forKey: self.mapUserDefaultString)
                            }
                        }
                        self.addProgressBarAndWheel()
                    }))
                    downloadAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
                        print("cancelling the download of assets")
                    }))
                    
                    self.delegate.present(downloadAlert, animated: true)
                }
            }
        })
    }
}
