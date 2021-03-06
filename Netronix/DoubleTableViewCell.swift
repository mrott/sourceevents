//
//  DoubleTableViewCell.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 21/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import UIKit

class DoubleTableViewCell: UITableViewCell {

    static let identifier = "DoubleTableViewCell"
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(measurement: DoubleMeasurement) {
        valueLabel.text = String(format: "%f %@", measurement._value, (measurement.event?._unit ?? ""))
    }
}
