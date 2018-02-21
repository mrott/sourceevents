//
//  Measurement.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 20/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import Foundation

class Measurement {
    var _id: Int
    
    init(id: Int) {
        _id = id
    }
}

class DoubleMeasurement: Measurement {
    var _value: Double
    
    init(id: Int, value: Double) {
        _value = value
        super.init(id: id)
    }
}

class StringMeasurement: Measurement {
    var _value: String
    
    init(id: Int, value: String) {
        _value = value
        super.init(id: id)
    }
}

class LocationMeasurement: Measurement {
    var _value: (Double, Double)
    
    init(id: Int, value: (Double, Double)) {
        _value = value
        super.init(id: id)
    }
}


