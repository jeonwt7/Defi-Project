//
//  HomeViewController+TableView.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/17.
//

import UIKit

extension HomeViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hotProducts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCardCell", for: indexPath) as? ProductCardCell
        else { return UITableViewCell() }
        cell.setupCell(productModel: hotProducts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 320
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            showTopBanner()
        } else if scrollView.contentOffset.y > 50 {
            hideTopBanner()
        }
    }
}
