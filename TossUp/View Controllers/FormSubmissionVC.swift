//
//  FormSubmissionVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 7/13/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit
import MessageUI

class FormSubmissionVC: UIViewController {
    
    var titleView: UIView!
    var table: UITableView!
    var thisFormType: Support!
    let backgroundColor: UIColor = .black
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = backgroundColor
        
        titleView = createTitleView(title: thisFormType.bannerTitle)
        addSendButton()
        setupTableView()
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectedNonTextField)))
    }
    
    private func addSendButton() {
        let sendButton = UIButton()
        sendButton.setImage(UIImage(systemName: "paperplane", withConfiguration: UIImage.SymbolConfiguration(pointSize: 17, weight: .regular))?.withTintColor(.Gold, renderingMode: .alwaysOriginal), for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        
        titleView.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.centerYAnchor.constraint(equalTo: titleView.centerYAnchor).isActive = true
        sendButton.centerXAnchor.constraint(equalTo: titleView.rightAnchor, constant: -27).isActive = true
    }
    
    private func setupTableView() {
        table = UITableView(frame: CGRect.zero, style: .grouped)
        table.register(TextTableViewCell.self, forCellReuseIdentifier: "TextTableViewCell")
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = backgroundColor
        table.rowHeight = thisFormType.cellSize
        table.sectionHeaderHeight = headerHeight
        table.sectionFooterHeight = 0
        table.separatorStyle = .none
        
        table.tableFooterView = createTableViewFooterButton()
        
        view.addSubview(table)
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: titleView.bottomAnchor, constant: 5).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
    }
    
    private func createTableViewFooterButton() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: headerHeight))
        footerView.backgroundColor = backgroundColor

        let button = UIButton()
        button.setTitle("Not Working?", for: .normal)
        button.setTitleColor(.GrayLight, for: .normal)
        button.titleLabel?.font = UIFont(name: "OpenSans-SemiBold", size: 16.5)
        button.addTarget(self, action: #selector(footerButtonPressed), for: .touchUpInside)
        
        footerView.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: footerView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: footerView.centerYAnchor).isActive = true
        
        return footerView
    }
    
    @objc func footerButtonPressed() {
        present(HelpVC(), animated: true)
    }
    
    @objc func sendButtonPressed(_ sender: UIButton) {
        print("send button pressed")
        
        guard MFMailComposeViewController.canSendMail() else {
            print("cannot send mail")
            return
        }
        
        let mail = MFMailComposeViewController()
        mail.mailComposeDelegate = self
        mail.setToRecipients(["tossup.team@gmail.com"])
        mail.setSubject("IN-APP: " + thisFormType.description)
        
        switch thisFormType {
            case .grenade:
                let map = (table.cellForRow(at: IndexPath(row: 0, section: 0)) as! TextTableViewCell).textField.text
                let grenadeType = (table.cellForRow(at: IndexPath(row: 0, section: 1)) as! TextTableViewCell).textField.text
                let location = (table.cellForRow(at: IndexPath(row: 0, section: 2)) as! TextTableViewCell).textField.text
                let throwLocation = (table.cellForRow(at: IndexPath(row: 0, section: 3)) as! TextTableViewCell).textField.text
                mail.setMessageBody("Map:\n\(map!)\n\nGrenade:\n\(grenadeType!)\n\nLocation:\n\(location!)\n\nThrow Location:\n\(throwLocation!)", isHTML: false)
            case .feature:
                let userText = (table.cellForRow(at: IndexPath(row: 0, section: 0)) as! TextTableViewCell).textView.text
                mail.setMessageBody("Request:\n\n \(userText!)", isHTML: false)
            case .bug:
                let userText = (table.cellForRow(at: IndexPath(row: 0, section: 0)) as! TextTableViewCell).textView.text
                mail.setMessageBody("Bug Report:\n\n \(userText!)", isHTML: false)
            default: break
        }
        
        present(mail, animated: true)
    }
}

extension FormSubmissionVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return thisFormType.sectionTitles.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = backgroundColor
        
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-SemiBold", size: 14)
        label.textColor = .GrayUltraLight
        label.textAlignment = .center
        
        label.text = thisFormType.sectionTitles[section]
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! TextTableViewCell
        cell.updateType(type: thisFormType)
        return cell
    }
}

extension FormSubmissionVC: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if error != nil { dismiss(animated: true, completion: nil) }
        
        switch result {
            case .cancelled: print("cancelled")
                print("cancelled")
                self.dismiss(animated: true, completion: nil)
            case .failed: print("failed")
            case .saved: print("saved")
                print("saved")
                self.dismiss(animated: true, completion: nil)
            case .sent:
                print("sent")
                self.dismiss(animated: true, completion: nil)
            default:
                print("default")
                self.dismiss(animated: true, completion: nil)
        }
    }
}
