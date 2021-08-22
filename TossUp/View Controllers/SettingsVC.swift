//
//  SettingsVC.swift
//  TossUp
//
//  Created by Carter Burzlaff on 6/16/20.
//  Copyright © 2020 Carter Burzlaff. All rights reserved.
//

import UIKit
import StoreKit

class SettingsVC: UIViewController {
    
    var table: UITableView!
    var premiumProduct: SKProduct?
    let backgroundColor: UIColor = .black
    var cellSize: CGFloat = 40
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setTitleLabel(title: "Settings")
        setBackButton(iconName: "chevron.left")
        
        addSwipeGestures(view)
        setupTableView()
        fetchProduct()
        SKPaymentQueue.default().add(self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // empty
    }
    
    private func setupTableView() {
        table = UITableView(frame: view.frame, style: .grouped)
        table.register(SettingsTableViewCell.self, forCellReuseIdentifier: "SettingsTableViewCell")
        table.delegate = self
        table.dataSource = self
        
        table.backgroundColor = backgroundColor
        table.rowHeight = cellSize
        table.sectionHeaderHeight = cellSize
        table.sectionFooterHeight = 0
        table.separatorStyle = .none

        table.tableFooterView = createTableViewFooter("Version 1.0", cellSize, backgroundColor)
        
        view.addSubview(table)
    }
    
    private func fetchProduct() {
        let request = SKProductsRequest(productIdentifiers: ["com.carterburzlaff.TossUp.premium"])
        request.delegate = self
        request.start()
    }
    
    private func tappedPremium() {
        SKPaymentQueue.default().restoreCompletedTransactions()
    }
}

extension SettingsVC: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return SettingsSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = SettingsSection(rawValue: section)
        switch section {
//            case .options: return Options.allCases.count
            case .options: return Options.allCases.count - 1
            case .video: return Video.allCases.count
            case .info: return Info.allCases.count
            case .support: return Support.allCases.count
            case .none: return 0
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = backgroundColor
        
        let label = UILabel()
        label.font = UIFont(name: "OpenSans-Bold", size: 12)
        label.textColor = .Gold
        label.text = SettingsSection(rawValue: section)?.description
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 18).isActive = true
        
        return view
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableViewCell", for: indexPath) as! SettingsTableViewCell
        
        let section = SettingsSection(rawValue: indexPath.section)
        switch section {
            case .options:
                cell.label.text = Options(rawValue: indexPath.row)?.description
                switch Options(rawValue: indexPath.row) {
                    case .premium:
                        if UserDefaults.standard.bool(forKey: "premium") {
                            cell.icon.image = UIImage(systemName: Options(rawValue: indexPath.row)!.icon)?.withTintColor(.white, renderingMode: .alwaysOriginal)
                        }
                        else {
                            cell.icon.image = UIImage(systemName: Options(rawValue: indexPath.row)!.icon)?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal)
                        }
                    case .notifications, .downloads:
                        cell.icon.image = UIImage(systemName: Options(rawValue: indexPath.row)!.icon)?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal)
                    default: break
                }
            case .video:
                cell.label.text = Video(rawValue: indexPath.row)?.description
                cell.icon.image = UIImage(systemName: Video(rawValue: indexPath.row)!.icon)?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal)
                switch Video(rawValue: indexPath.row) {
                    case .autoplay: cell.addToggle(type: Video(rawValue: indexPath.row)!)
                    case .landscapeOnly: cell.addToggle(type: Video(rawValue: indexPath.row)!)
                    case .landscapeStart: cell.addSideLabel(type: Video(rawValue: indexPath.row)!)
                    default: break
                }
            case .info:
                cell.label.text = Info(rawValue: indexPath.row)?.description
                cell.icon.image = UIImage(systemName: Info(rawValue: indexPath.row)!.icon)?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal)
            case .support:
                cell.label.text = Support(rawValue: indexPath.row)?.description
                cell.icon.image = UIImage(systemName: Support(rawValue: indexPath.row)!.icon)?.withTintColor(.GrayLight, renderingMode: .alwaysOriginal)
            default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = SettingsSection(rawValue: indexPath.section)
        switch section {
            case .options:
                switch Options(rawValue: indexPath.row) {
                    case .premium:
                        if !UserDefaults.standard.bool(forKey: "premium") { tappedPremium() }
                    case .notifications:
                        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else { return }
                        if UIApplication.shared.canOpenURL(settingsURL) {
                            UIApplication.shared.open(settingsURL)
                        }
                    case .downloads:
                        let vc = Options(rawValue: indexPath.row)!.connectedVC
                        present(vc, animated: true)
                    default: break
                }
            case .video:
                switch Video(rawValue: indexPath.row) {
                    case .landscapeStart:
                        print(UserDefaults.standard.string(forKey: "av_landscape_orientation")!)
                        if UserDefaults.standard.string(forKey: "av_landscape_orientation") == "Right" {
                            UserDefaults.standard.set("Left", forKey: "av_landscape_orientation")
                        }
                        else {
                            UserDefaults.standard.set("Right", forKey: "av_landscape_orientation")
                        }
                        table.reloadData()
                    default: break
                }
            case .info:
                let vc = Info(rawValue: indexPath.row)!.connectedVC
                present(vc, animated: true)
            case .support:
                let vc = Support(rawValue: indexPath.row)!.connectedVC as! FormSubmissionVC
                vc.thisFormType = Support(rawValue: indexPath.row)
                present(vc, animated: true)
            default: break
        }
        table.deselectRow(at: indexPath, animated: true)
    }
}

extension SettingsVC: SKProductsRequestDelegate, SKPaymentTransactionObserver {
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        if let product = response.products.first {
            premiumProduct = product
        }
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for transaction in transactions {
            switch transaction.transactionState {
                case .purchasing: break
                case .purchased, .restored:
                    UserDefaults.standard.set(true, forKey: "premium")
                    SKPaymentQueue.default().finishTransaction(transaction)
                    table.reloadData()
                    break
                case .failed, .deferred:
                    SKPaymentQueue.default().finishTransaction(transaction)
                    break
                default:
                    SKPaymentQueue.default().finishTransaction(transaction)
                    break
            }
        }
    }
    
    func paymentQueueRestoreCompletedTransactionsFinished(_ queue: SKPaymentQueue) {
        table.reloadData()
    }
    
    func paymentQueue(_ queue: SKPaymentQueue, restoreCompletedTransactionsFailedWithError error: Error) {
        print(error)
        
        guard let premiumProduct = premiumProduct else{
            return
        }
        if SKPaymentQueue.canMakePayments() {
            let payment = SKPayment(product: premiumProduct)
            SKPaymentQueue.default().add(payment)
        }
    }
}
