//
//  ProductCardCell.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/17.
//

import UIKit

class ProductCardCell: UITableViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var typeBackground: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var firstProperty: UILabel!
    @IBOutlet weak var secondProperty: UILabel!
    @IBOutlet weak var thirdProperty: UILabel!
    @IBOutlet weak var fourthProperty: UILabel!
    @IBOutlet weak var firstValue: UILabel!
    @IBOutlet weak var secondValue: UILabel!
    @IBOutlet weak var thirdValue: UILabel!
    @IBOutlet weak var fourthValue: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var progressValue: UILabel!
    @IBOutlet weak var progressPercentage: UILabel!
    @IBOutlet weak var depositButton: UIButton!
    @IBOutlet weak var whiteBackgroundView: UIView!
    
    var progressViewConstraint: NSLayoutConstraint? = nil
    var whiteBackgroundViewConstraint: NSLayoutConstraint? = nil
    var depositButtonConstraint: NSLayoutConstraint? = nil
    var logoWidthConstraint: NSLayoutConstraint? = nil
    var productModel: ProductModel? = nil

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
        self.whiteBackgroundView.layer.cornerRadius = 10
        self.depositButton.layer.cornerRadius = 2
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowColor = CGColor(red: 0, green: 0, blue: 0, alpha: 0.05)
        self.layer.shadowRadius = 10
    }
    
    func setupCell(productModel: ProductModel) {
        self.productModel = productModel
        title.text = productModel.title
        subtitle.text = productModel.subtitle
        type.text = productModel.type.description
        type.textColor = productModel.type.textColor
        typeBackground.backgroundColor = productModel.type.textBackgroundColor
        firstValue.text = productModel.apr.description + "%"
        productImage.image = UIImage(named: productModel.title)
        
        setupLogoWidth()
        setupFourthProperty()
        setupProgressView()
        setupWhiteBackground()
        
        switch productModel.type {
        case .lockUp:
            typeBackground.widthAnchor.constraint(equalToConstant: 55).isActive = true
            secondProperty.text = "Minimum Quantity"
            secondValue.text = (productModel.minimumQuantity?.description ?? "") + productModel.title
            thirdProperty.text = "Duration"
            thirdValue.text = String(productModel.duration!) + " Month"
        case .singlePool:
            typeBackground.widthAnchor.constraint(equalToConstant: 70).isActive = true
            secondProperty.text = "Deposited " + "(" + productModel.title + ")"
            secondValue.text = productModel.deposited?.stringWithCommas(decimalPlaces: 2)
            thirdProperty.text = "VL " + "(" + productModel.title + ")"
            thirdValue.text = productModel.vl?.stringWithCommas(decimalPlaces: 2)
            fourthProperty.text = "Remaining " + "(" + productModel.title + ")"
            fourthValue.text = productModel.remaining?.stringWithCommas(decimalPlaces: 2)
        case .liquidityPool:
            typeBackground.widthAnchor.constraint(equalToConstant: 85).isActive = true
            secondProperty.text = "Earned ($)"
            secondValue.text = productModel.earned?.stringWithCommas(decimalPlaces: 2)
            thirdProperty.text = "Deposited ($)"
            thirdValue.text = productModel.deposited?.stringWithCommas(decimalPlaces: 2)
            fourthProperty.text = "Liquidity ($)"
            fourthValue.text = productModel.liquidity?.stringWithCommas(decimalPlaces: 2)
        }
        
        if let current = productModel.current, let total = productModel.total {
            progressValue.text = current.description + " / " + total.stringWithCommas(decimalPlaces: 0) + " " + productModel.title
            progressPercentage.text = (current * 100 / total).stringWithCommas(decimalPlaces: 1) + "%"
            progressView.setProgress(Float(current / total), animated: true)
        }
    }
    
    func setupLogoWidth() {
        logoWidthConstraint?.isActive = false
        if productModel?.type == .liquidityPool {
            logoWidthConstraint = productImage.widthAnchor.constraint(equalToConstant: 44)
        } else {
            logoWidthConstraint = productImage.widthAnchor.constraint(equalToConstant: 25)
        }
        logoWidthConstraint?.isActive = true
    }
    
    func setupFourthProperty() {
        if productModel?.type == .lockUp {
            fourthProperty.isHidden = true
            fourthValue.isHidden = true
            progressViewConstraint?.isActive = false
            progressViewConstraint = progressView.topAnchor.constraint(equalTo: thirdProperty.bottomAnchor, constant: 15)
            progressViewConstraint?.isActive = true
        } else {
            fourthProperty.isHidden = false
            fourthValue.isHidden = false
            progressViewConstraint?.isActive = false
            progressViewConstraint = progressView.topAnchor.constraint(equalTo: fourthProperty.bottomAnchor, constant: 15)
            progressViewConstraint?.isActive = true
        }
        
    }
    
    func setupProgressView() {
        if productModel?.type == .liquidityPool {
            progressView.isHidden = true
            progressValue.isHidden = true
            progressPercentage.isHidden = true
            depositButtonConstraint?.isActive = false
            depositButtonConstraint = depositButton.topAnchor.constraint(equalTo: fourthProperty.bottomAnchor, constant: 15)
            depositButtonConstraint?.isActive = true
        } else {
            progressView.isHidden = false
            progressValue.isHidden = false
            progressPercentage.isHidden = false
            depositButtonConstraint?.isActive = false
            depositButtonConstraint = depositButton.topAnchor.constraint(equalTo: progressValue.bottomAnchor, constant: 15)
            depositButtonConstraint?.isActive = true
        }
    }
    
    func setupWhiteBackground() {
        guard let productModel = productModel else { return }
        whiteBackgroundViewConstraint?.isActive = false
        switch productModel.type {
        case .lockUp:
            whiteBackgroundViewConstraint = whiteBackgroundView.heightAnchor.constraint(equalToConstant: 278)
        case .singlePool:
            whiteBackgroundViewConstraint = whiteBackgroundView.heightAnchor.constraint(equalToConstant: 308)
        case .liquidityPool:
            whiteBackgroundViewConstraint = whiteBackgroundView.heightAnchor.constraint(equalToConstant: 263)
        }
        whiteBackgroundViewConstraint?.isActive = true
    }

}
