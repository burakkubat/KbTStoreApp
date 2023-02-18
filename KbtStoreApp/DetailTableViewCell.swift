//
//  DetailTableViewCell.swift
//  KbtStoreApp
//
//  Created by Burak Kubat on 18.02.2023.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

    @IBOutlet weak var productTitleLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productReviewLbl: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
