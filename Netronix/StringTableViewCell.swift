//
//  StringTableViewCell.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 21/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import UIKit

class StringTableViewCell: UITableViewCell {

    static let identifier = "StringTableViewCell"
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(measurement: StringMeasurement) {
        valueLabel.text = measurement._value + " " + (measurement.event?._unit ?? "")
    }
}
