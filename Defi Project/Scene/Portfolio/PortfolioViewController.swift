//
//  PortfolioViewController.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/18.
//

import UIKit

class PortfolioViewController: UIViewController {
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var dropboxView: UIView!
    @IBOutlet weak var dropboxButton: UIButton!
    @IBOutlet weak var noticeView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    var products: [ProductModel] = []
    var noticeViewConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        fetchProducts()
        setupTableView()
        setupViews()
        closeDropBox()
    }
    
    func fetchProducts() {
        products = MockServer.products.filter { model in model.isHotProduct }
    }

    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "ProductCardCell", bundle: .main), forCellReuseIdentifier: "ProductCardCell")
    }
    
    func setupViews() {
        topView.layer.cornerRadius = 10
        dropboxView.layer.cornerRadius = 10
        noticeView.layer.cornerRadius = 3
        noticeView.layer.borderWidth = 1
        noticeView.layer.borderColor = CGColor(red: 0.33, green: 0.43, blue: 0.96, alpha: 0.5)
    }
    
    func openDropBox() {
        dropboxView.isHidden = false
        noticeViewConstraint?.isActive = false
        noticeViewConstraint = noticeView.topAnchor.constraint(equalTo: dropboxView.bottomAnchor, constant: 12)
        noticeViewConstraint?.isActive = true
        dropboxButton.setImage(UIImage(named: "Portfolio_DropUp"), for: .normal)
    }
    
    func closeDropBox() {
        dropboxView.isHidden = true
        noticeViewConstraint?.isActive = false
        noticeViewConstraint = noticeView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 12)
        noticeViewConstraint?.isActive = true
        dropboxButton.setImage(UIImage(named: "Portfolio_DropDown"), for: .normal)
    }
    
    @IBAction func dropBoxPressed(_ sender: Any) {
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
