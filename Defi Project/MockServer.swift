//
//  MockServer.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/20.
//

import Foundation

class MockServer {
    static let products: [ProductModel] = [
        ProductModel(type: .singlePool, title: "BTC", subtitle: "BTC-SP0001", apr: 7.83, isHotProduct: true).setupSinglePool(deposited: 2429112.00, vl: 1070877.00, remaining: 1070877.00, current: 845.536, total: 1500),
        ProductModel(type: .lockUp, title: "ETH", subtitle: "ETH-SP0001", apr: 6.51, isHotProduct: true).setupLockUp(minimumQuantity: 0.01, duration: 3, current: 845.536, total: 1500),
        ProductModel(type: .lockUp, title: "BTC", subtitle: "BTC-SP0001", apr: 7.83).setupLockUp(minimumQuantity: 0.01, duration: 3, current: 845.536, total: 1500),
        ProductModel(type: .singlePool, title: "USDC", subtitle: "USDC-SP0001", apr: 7.83).setupSinglePool(deposited: 2429122.00, vl: 1070877.00, remaining: 1070877.00, current: 845.536, total: 1500),
        ProductModel(type: .singlePool, title: "DAI", subtitle: "DAI-SP0001", apr: 6.51).setupSinglePool(deposited: 2429122.00, vl: 1070877.00, remaining: 1070877.00, current: 845.536, total: 1500),
        ProductModel(type: .liquidityPool, title: "BTC-USDT", subtitle: "BU-LP0001", apr: 146.83).setupLiquidityPool(deposited: 128.2345, earned: 0.0000, liquidity: 727794989),
        ProductModel(type: .liquidityPool, title: "ETH-USDT", subtitle: "BU-LP0001", apr: 134.92).setupLiquidityPool(deposited: 128.2345, earned: 0.0000, liquidity: 727794989)
    ]
    
    static let assets = [
        AssetModel(title: "BTC", subtitle: "Bitcoin", value: 21.8733, dollarValue: 982502.40),
        AssetModel(title: "USDT", subtitle: "Tether", value: 21.8723, dollarValue: 982502.40),
        AssetModel(title: "ETH", subtitle: "Ethereum", value: 21.8723, dollarValue: 982502.40)
    ]
}
