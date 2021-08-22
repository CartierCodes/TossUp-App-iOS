//
//  HelpVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 8/27/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit

class HelpVC: UIViewController {
    
    var titleView: UIView!
    var table: UITableView!
    let backgroundColor: UIColor = .black
    let help = [
        ["Support submission form isn't working.",
         "How to do a jump-throw?",
         "How do I know what kind of throw to do?",
         "Grenade buttons are too small."],
        ["Our support forms are linked to the apple mail app. If you arent signed in then please message us directly using this email: tossup.team@gmail.com",
         "Enter the command below into the console to bind the jump-throw to \"T\". Hold left click with the grenade selected and press \"T\" to throw\n\nbind \"T\" \"+jump; -attack; -jump\"",
         "Every throw will be a left click throw unless noted in the upper left of the video",
         "On the minimap page, there is a dropdown box which allows you to change the size of the icons"
        ]
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        titleView = createTitleView(title: "Help")
        setupTableView()
    }
    
    private func setupTableView() {
        table = UITableView(frame: .zero, style: .grouped)
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

extension HelpVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return help[0].count
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
        
        label.text = help[0][section]
        
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
        cell.label.text = help[1][indexPath.section]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
