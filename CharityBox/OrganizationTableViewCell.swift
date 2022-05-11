//
//  OrganizationTableViewCell.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import UIKit

class OrganizationTableViewCell: UITableViewCell {

    @IBOutlet weak var imageVw: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var shortNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
