//
//  HomeViewController.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/16.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var topBanner: UIView!
    @IBOutlet weak var settingButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noticeImage: UIImageView!
    @IBOutlet weak var announcementArea: UIButton!
    @IBOutlet weak var moreImage: UIImageView!
    @IBOutlet weak var hotProductLabel: UILabel!
    
    var hotProductTopConstraint: NSLayoutConstraint?
    var hotProducts: [ProductModel] = []
    
    override func viewDidLoad() {
        tabBarController?.tabBar.tintColor = UIColor(named: "MainBlue")
        fetchHotProducts()
        setupTopBanner()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        showTopBanner()
    }
    
    func fetchHotProducts() {
        hotProducts = MockServer.products.filter { model in model.isHotProduct }
    }
    
    func setupTopBanner() {
        topBanner.layer.cornerRadius = 10
        topBanner.layer.shadowOffset = CGSize(width: 0, height: 2)
        topBanner.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        topBanner.layer.shadowRadius = 10
        topBanner.backgroundColor = .init(named: "MainBlue")
        
        let firstTitle = UILabel(frame: CGRect(x: 15, y: 22, width: 160, height: 25))
        firstTitle.text = "Start Defi Staking"
        firstTitle.font = UIFont(name: "Roboto-Bold", size: 17)
        firstTitle.textColor = .white
        firstTitle.textAlignment = .left
        topBanner.addSubview(firstTitle)
        
        let firstSubTitle = UILabel(frame: CGRect(x: 15, y: 49, width: 221, height: 18))
        firstSubTitle.text = "Increase user staking income with us!"
        firstSubTitle.font = UIFont(name: "Roboto-Regular", size: 12)
        firstSubTitle.textColor = .white
        firstSubTitle.textAlignment = .left
        topBanner.addSubview(firstSubTitle)
        
        let bannerImage = UIImageView()
        topBanner.addSubview(bannerImage)
        bannerImage.image = UIImage(named: "Home_BannerCoin")
        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        bannerImage.bottomAnchor.constraint(equalTo: topBanner.bottomAnchor).isActive = true
        bannerImage.widthAnchor.constraint(equalTo: topBanner.widthAnchor).isActive = true
        bannerImage.topAnchor.constraint(equalTo: topBanner.topAnchor).isActive = true
        bannerImage.leadingAnchor.constraint(equalTo: topBanner.leadingAnchor).isActive = true
        
        let pageControl = UIImageView(frame: CGRect(x: 16, y: 75, width: 31, height: 3))
        topBanner.addSubview(pageControl)
        pageControl.image = UIImage(named: "Home_PageControl")
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "ProductCardCell", bundle: .main), forCellReuseIdentifier: "ProductCardCell")
    }
    
    func hideTopBanner() {
        topBanner.isHidden = true
        settingButton.isHidden = true
        announcementArea.isHidden = true
        moreImage.isHidden = true
        noticeImage.isHidden = true
        hotProductTopConstraint?.isActive = false
        hotProductTopConstraint = hotProductLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12)
        hotProductTopConstraint?.isActive = true
    }

    func showTopBanner() {
        topBanner.isHidden = false
        settingButton.isHidden = false
        announcementArea.isHidden = false
        moreImage.isHidden = false
        noticeImage.isHidden = false
        hotProductTopConstraint?.isActive = false
        hotProductTopConstraint = hotProductLabel.topAnchor.constraint(equalTo: noticeImage.bottomAnchor, constant: 12)
        hotProductTopConstraint?.isActive = true
    }
    
}

