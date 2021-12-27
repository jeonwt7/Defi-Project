//
//  WalletViewController+TableView.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/18.
//

import UIKit

extension WalletViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WalletCardCell", for: indexPath) as? WalletCardCell
        else { return UITableViewCell() }
        cell.setupCell(assetModel: assets[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 144
    }
    
    
}
