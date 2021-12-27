//
//  ProductViewController.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/19.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    @IBOutlet weak var thirdLabel: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lockUpButton: UIButton!
    @IBOutlet weak var singlePoolButton: UIButton!
    @IBOutlet weak var liquidityPoolButton: UIButton!
    @IBOutlet weak var selectedLine: UIImageView!
    
    weak var pageViewController: ProductPageViewController?
    var buttonsConstraint: NSLayoutConstraint?
    var products: [ProductModel] = []
    var productType: ProductType = .lockUp
    var goToSelectedPage: ((_ index: Int) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupWithType()
        fetchProducts()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if pageViewController?.isTopBannerHidden == true {
            hideTopBanner()
        } else {
            showTopBanner()
        }
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .clear
        tableView.register(UINib(nibName: "ProductCardCell", bundle: .main), forCellReuseIdentifier: "ProductCardCell")
    }
    
    func setupWithType() {
        view.backgroundColor = productType.backgroundColor
        firstLabel.text = productType.firstLineText
        secondLabel.text = productType.secondLineText
        imageView.heightAnchor.constraint(equalToConstant: productType.imageSize.height).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: productType.imageSize.width).isActive = true
        imageView.image = productType.image
        var selectedButton = UIButton()
        switch productType {
        case .lockUp:
            selectedButton = lockUpButton
        case .singlePool:
            selectedButton = singlePoolButton
        case .liquidityPool:
            selectedButton = liquidityPoolButton
        }
        selectedButton.titleLabel?.font = UIFont(name: "Roboto-Black", size: 15)
        selectedButton.alpha = 1
        selectedLine.centerXAnchor.constraint(equalTo: selectedButton.centerXAnchor).isActive = true
        selectedLine.widthAnchor.constraint(equalTo: selectedButton.widthAnchor).isActive = true
    }
    
    func fetchProducts() {
        products = MockServer.products.filter { model in model.type == productType }
    }
    
    func hideTopBanner() {
        firstLabel.isHidden = true
        secondLabel.isHidden = true
        thirdLabel.isHidden = true
        imageView.isHidden = true
        buttonsConstraint?.isActive = false
        buttonsConstraint = lockUpButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12)
        buttonsConstraint?.isActive = true
        pageViewController?.isTopBannerHidden = true
    }
    
    func showTopBanner() {
        firstLabel.isHidden = false
        secondLabel.isHidden = false
        imageView.isHidden = false
        thirdLabel.isHidden = false
        view.sendSubviewToBack(imageView)
        
        buttonsConstraint?.isActive = false
        buttonsConstraint = lockUpButton.topAnchor.constraint(equalTo: thirdLabel.bottomAnchor, constant: 20)
        buttonsConstraint?.isActive = true
        pageViewController?.isTopBannerHidden = false
    }
    
    static func loadFromXib(parent: ProductPageViewController, type: ProductType) -> ProductViewController {
        let vc = ProductViewController(nibName: "ProductViewController", bundle: .main)
        vc.pageViewController = parent
        vc.productType = type
        return vc
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        guard let sender = sender as? UIButton else { return }
        goToSelectedPage?(sender.tag)
    }
    
}
