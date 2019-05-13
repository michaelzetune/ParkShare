//
//  ProfileCell.swift
//  ParkShare
//
//  Created by Saras Paudel on 5/13/19.
//  Copyright © 2019 Michael Zetune. All rights reserved.
//

import UIKit

class ProfileCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infospotLabel: UILabel!
    @IBOutlet weak var profilepicImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var parkingImage: UIImageView!
    @IBOutlet weak var editListingButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
