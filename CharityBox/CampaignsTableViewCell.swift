//
//  CampaignsTableViewCell.swift
//  CharityBox
//
//  Created by Mert Çelik on 3.04.2022.
//

import UIKit

class CampaignsTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCampName: UILabel!
    
    @IBOutlet weak var campProgress: UIProgressView!
    
    @IBOutlet weak var imageCamp: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
