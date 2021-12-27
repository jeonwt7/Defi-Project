//
//  ProductViewController+TableView.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/19.
//

import UIKit

extension ProductViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCardCell", for: indexPath) as? ProductCardCell
        else { return UITableViewCell() }
        cell.setupCell(productModel: products[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch products[indexPath.item].type {
        case .lockUp:
            return 290
        case .singlePool:
            return 320
        case .liquidityPool:
            return 275
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            showTopBanner()
        } else if scrollView.contentOffset.y > 50 {
            hideTopBanner()
        }
    }
}
