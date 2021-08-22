//
//  ChangelogVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 8/17/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class ChangelogVC: UIViewController {
    
    var titleView: UIView!
    var table: UITableView!
    let backgroundColor: UIColor = .black
    let changelog = [
        ["1.0"],
        [" - Initial Release\n\n\n"]
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        titleView = createTitleView(title: "Changelog")
        setupTableView()
    }
    
    private func setupTableView() {
        table = UITableView(frame: CGRect.zero, style: .grouped)
        table.register(ChangelogTableViewCell.self, forCellReuseIdentifier: "ChangelogTableViewCell")
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = backgroundColor
        table.sectionHeaderHeight = headerHeight
        table.sectionFooterHeight = 0
        table.separatorStyle = .none
        
        table.tableFooterView = createTableViewFooter("More coming soon...", headerHeight, backgroundColor)
        
        view.addSubview(table)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: titleView.bottomAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
}

extension ChangelogVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return changelog[0].count
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
        
        label.text = "v. " + changelog[0][section]
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChangelogTableViewCell", for: indexPath) as! ChangelogTableViewCell
        cell.label.text = changelog[1][indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
    }
}
