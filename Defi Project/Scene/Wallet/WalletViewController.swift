//
//  WalletViewController.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/18.
//

import UIKit

class WalletViewController: UIViewController {
    
    var assets: [AssetModel] = []
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var dropboxView: UIView!
    @IBOutlet weak var dropboxButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var checkButton: UIButton!
    
    var checkButtonConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        searchBar.searchBarStyle = .minimal
        searchBar.searchTextField.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1.0)
        topView.layer.cornerRadius = 10
        dropboxView.layer.cornerRadius = 10
        closeDropBox()
        fetchAssets()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "WalletCardCell", bundle: .main), forCellReuseIdentifier: "WalletCardCell")
    }
    
    func fetchAssets() {
        assets = [AssetModel(title: "BTC", subtitle: "Bitcoin", value: 21.8733, dollarValue: 982502.40), AssetModel(title: "USDT", subtitle: "Tether", value: 21.8723, dollarValue: 982502.40), AssetModel(title: "ETH", subtitle: "Ethereum", value: 21.8723, dollarValue: 982502.40)]
    }
    
    func openDropBox() {
        dropboxView.isHidden = false
        checkButtonConstraint?.isActive = false
        checkButtonConstraint = checkButton.topAnchor.constraint(equalTo: dropboxView.bottomAnchor, constant: 15)
        checkButtonConstraint?.isActive = true
        dropboxButton.setImage(UIImage(named: "Portfolio_DropUp"), for: .normal)
    }
    
    func closeDropBox() {
        dropboxView.isHidden = true
        checkButtonConstraint?.isActive = false
        checkButtonConstraint = checkButton.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 15)
        checkButtonConstraint?.isActive = true
        dropboxButton.setImage(UIImage(named: "Portfolio_DropDown"), for: .normal)
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if button.tag == 0 { // close -> open
            openDropBox()
            button.tag = 1
        } else {
            closeDropBox()
            button.tag = 0
        }
    }
}
