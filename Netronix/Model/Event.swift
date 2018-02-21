//
//  Event.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 20/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import Foundation

class Event {
    
    var _id: String
    var _name: String
    var _unit: String?
    var _measurements: [Measurement]
    
    init(id: String, name: String, unit: String?, measurements: [Measurement]) {
        _id = id
        _name = name
        _unit = unit
        _measurements = measurements
    }
    
}
