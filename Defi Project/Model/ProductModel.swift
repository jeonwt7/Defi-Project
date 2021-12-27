//
//  ProductModel.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/17.
//

import UIKit

class ProductModel {
    let type: ProductType
    let title: String
    let subtitle: String
    var isHotProduct: Bool = false
    var apr: Double
    var deposited: Double? = nil
    var vl: Double? = nil
    var remaining: Double? = nil
    var minimumQuantity: Double? = nil
    var duration: Int? = nil
    var earned: Double? = nil
    var liquidity: Double? = nil
    var current: Double? = nil
    var total: Double? = nil
    
    init(type: ProductType, title: String, subtitle: String, apr: Double, isHotProduct: Bool = false) {
        self.type = type
        self.title = title
        self.subtitle = subtitle
        self.apr = apr
        self.isHotProduct = isHotProduct
    }
    
   func setupSinglePool(deposited: Double, vl: Double, remaining: Double, current: Double, total: Double) -> Self {
        self.deposited = deposited
        self.vl = vl
        self.remaining = remaining
        self.current = current
        self.total = total
        return self
    }
    
    func setupLockUp(minimumQuantity: Double, duration: Int, current: Double, total: Double) -> Self {
        self.minimumQuantity = minimumQuantity
        self.duration = duration
        self.current = current
        self.total = total
        return self
    }
    
    func setupLiquidityPool(deposited: Double, earned: Double, liquidity: Double) -> Self {
        self.deposited = deposited
        self.earned = earned
        self.liquidity = liquidity
        return self
    }
}

enum ProductType: String {
    case singlePool = "Single Pool"
    case lockUp = "Lock Up"
    case liquidityPool = "Liquidity Pool"
    
    var description: String {
        return self.rawValue
    }
    
    var textColor: UIColor? {
        switch self {
        case .lockUp:
            return UIColor(named: "LockUp_Text")
        case .singlePool:
            return UIColor(named: "SinglePool_Text")
        case .liquidityPool:
            return UIColor(named: "LiquidityPool_Text")
        }
    }
    
    var textBackgroundColor: UIColor? {
        switch self {
        case .lockUp:
            return UIColor(named: "LockUp_TextBackground")
        case .singlePool:
            return UIColor(named: "SinglePool_TextBackground")
        case .liquidityPool:
            return UIColor(named: "LiquidityPool_TextBackground")
        }
    }
    
    var backgroundColor: UIColor? {
        switch self {
        case .lockUp:
            return UIColor(named: "MainBlue")
        case .singlePool:
            return UIColor(named: "SinglePool_Background")
        case .liquidityPool:
            return UIColor(named: "LiquidityPool_Background")
        }
    }
    
    var image: UIImage? {
        switch self {
        case .lockUp:
            return UIImage(named: "Product_LockUp")
        case .singlePool:
            return UIImage(named: "Product_SinglePool")
        case .liquidityPool:
            return UIImage(named: "Product_LiquidityPool")
        }
    }
    
    var imageSize: CGSize {
        switch self {
        case .lockUp:
            return CGSize(width: 72, height: 80)
        case .singlePool:
            return CGSize(width: 83, height: 89)
        case .liquidityPool:
            return CGSize(width: 132, height: 64)
        }
    }
    
    var firstLineText: String {
        switch self {
        case .lockUp:
            return "Earn more interest by locking up your"
        case .singlePool:
            return "Earn interest every day & withdraw"
        case .liquidityPool:
            return "Earn passive income by providing"
        }
    }
    
    var secondLineText: String {
        switch self {
        case .lockUp:
            return "deposit at any time!"
        case .singlePool:
            return "your deposit at any time!"
        case .liquidityPool:
            return "liquidity with crypto pairs!"
        }
    }
    
}
