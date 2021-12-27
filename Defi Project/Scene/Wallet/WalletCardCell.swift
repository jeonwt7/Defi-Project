//
//  WalletCardCell.swift
//  Defi Project
//
//  Created by Wootae Jeon on 2021/08/18.
//

import UIKit

class WalletCardCell: UITableViewCell {
    @IBOutlet weak var whiteBackgroundView: UIView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var dollarValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        whiteBackgroundView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(assetModel: AssetModel) {
        logo.image = UIImage(named: assetModel.title)
        title.text = assetModel.title
        subtitle.text = assetModel.subtitle
        value.text = assetModel.value.description + " " + assetModel.title
        dollarValue.text = "≈ $" + assetModel.dollarValue.stringWithCommas(decimalPlaces: 2)
    }
}
