//
//  AboutVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 8/16/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class AboutVC: UIViewController {
    
    var titleView: UIView!
    var table: UITableView!
    let backgroundColor: UIColor = .black
    let about = [
        ["Design", "Feedback", "Ads", "Disclaimer"],
        ["No matter your rank, TossUp is designed to allow you to quickly and easily learn CS:GO grenade lineups. The video tutorials are short and sweet, allowing you to learn linups in-between rounds",
         "Community involvement in the development of TossUp is highly encouraged. It allows us to make design choices based on what the community wants. To do so, choose an option in the Support section of the Settings menu",
         "Nobody likes ads, but the ad system in place allows us to sustain development while being the most minimally intrusive on the user experience. If you really don't want ads or you want to support the app, feel free to purchase the $0.99 premium upgrade",
         "TossUp is not affiliated with Counter-Strike: Global Offensive or Valve Corporation. The rights to each map's logo and minimap belong to Valve Corperation"
        ]
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        titleView = createTitleView(title: "About")
        setupTableView()
    }
    
    private func setupTableView() {
        table = UITableView(frame: CGRect.zero, style: .grouped)
        table.register(AboutTableViewCell.self, forCellReuseIdentifier: "AboutTableViewCell")
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = .black
        table.sectionHeaderHeight = headerHeight
        table.sectionFooterHeight = 25
        table.separatorStyle = .none
                
        view.addSubview(table)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
}

extension AboutVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return about[0].count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = backgroundColor
        
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 15)
        label.textColor = .white
        label.textAlignment = .center
        
        label.text = about[0][section]
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = backgroundColor
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutTableViewCell", for: indexPath) as! AboutTableViewCell
        cell.label.text = about[1][indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
