//
//  EventFactory.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 21/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import Foundation
import SwiftyJSON

class EventFactory {
    
    static func makeEvents(data: String) -> [Event] {
        let json = JSON.init(parseJSON: data)
        
        if let array = json.array {
            var events: [Event] = []
            
            for json in array {
                if let event = makeEvent(json: json) {
                    events.append(event)
                }
            }
            
            return events
        }
        return []
    }
    
    fileprivate static func makeEvent(json: JSON) -> Event? {
        guard let name = json.dictionary?["name"]?.string else {
            return nil
        }
        guard let _id = json.dictionary?["_id"]?.string else {
            return nil
        }
        guard let jsonMeasurements = json.dictionary?["measurements"]?.array else {
            return nil
        }
        let unit = json.dictionary?["unit"]?.string
        
        var measurements: [Measurement] = []
        for jsonMeasurement in jsonMeasurements {
            if let measurement = MeasurementFactory.makeMeasurement(json: jsonMeasurement) {
                measurements.append(measurement)
            }
        }
        
        let event = Event(id: _id, name: name, unit: unit, measurements: measurements)
        return event
    }
    
}
