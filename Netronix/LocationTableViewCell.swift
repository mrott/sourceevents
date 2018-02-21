//
//  LocationTableViewCell.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 21/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import UIKit

class LocationTableViewCell: UITableViewCell {

    static let identifier = "LocationTableViewCell"
    
    @IBOutlet weak var latLabel: UILabel!
    @IBOutlet weak var longLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
