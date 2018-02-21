//
//  MeasurementFactory.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 21/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import Foundation
import SwiftyJSON

class MeasurementFactory {
    
    static func makeMeasurement(json: JSON) -> Measurement? {
        guard let array = json.array, array.count >= 2 else {
            return nil
        }
        
        guard let id = array.first?.int else {
            return nil
        }
        
        //  Check the type of the second item in array
        if let doubleValue = array[1].double {
            let measurement = DoubleMeasurement(id: id, value: doubleValue)
            return measurement
        }
        if let stringValue = array[1].string {
            let measurement = StringMeasurement(id: id, value: stringValue)
            return measurement
        }
        if let arrayValue = array[1].array, arrayValue.count >= 2 {
            guard let lat = arrayValue[0].double else {
                return nil
            }
            guard let long = arrayValue[1].double else {
                return nil
            }
            let measurement = LocationMeasurement(id: id, value: (lat, long))
            return measurement
        }
        
        return nil
    }
    
}
