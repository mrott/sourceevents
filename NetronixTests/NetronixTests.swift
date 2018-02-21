//
//  NetronixTests.swift
//  NetronixTests
//
//  Created by Rott Marius Gabriel on 20/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import Netronix

class NetronixTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    fileprivate var envDevEventSourceWorkingExpectation: XCTestExpectation?
    func testEnvDevEventSource() {
        envDevEventSourceWorkingExpectation = expectation(description: "Event source working expectation")
        
        let eventSource = EnvDevEventSource(delegate: self)
        eventSource.startListening()
        
        wait(for: [envDevEventSourceWorkingExpectation!], timeout: 100)
    }
    
    func testEventFactory() {
        let sample = "[{\"name\":\"Batt. Voltage\",\"unit\":\"V\",\"measurements\":[[1519218318,13.535382312289563],[1519218319,12.479881855837002],[1519218320,13.613236044087529]],\"_id\":\"5a8d6e9021f2b20001c2f636\"},{\"name\":\"Serial\",\"measurements\":[],\"_id\":\"5a8d6e9021f2b20001c2f638\"},{\"name\":\"Temperature\",\"unit\":\"â„ƒ\",\"measurements\":[[1519218316,4.576834931938797],[1519218317,5.028235848274738],[1519218318,5.050917421259239],[1519218319,4.8368563488652265],[1519218320,4.720195441200817]],\"_id\":\"5a8d6e9021f2b20001c2f634\"},{\"name\":\"PM1\",\"unit\":\"mg/mÂ³\",\"measurements\":[[1519218317,0.3603002467544895],[1519218318,0.38554647507906326],[1519218319,0.39070382282079574],[1519218320,0.3440889433654415]],\"_id\":\"5a8d6e9021f2b20001c2f632\"},{\"name\":\"Pressure\",\"unit\":\"hPa\",\"measurements\":[[1519218316,1020.2022578207363],[1519218317,980.8514041735093],[1519218318,1000.6312592467393],[1519218319,982.1776910835885],[1519218320,1047.4034973546418]],\"_id\":\"5a8d6e9021f2b20001c2f637\"}]"
        
        let events = EventFactory.makeEvents(data: sample)
        XCTAssert(events.count == 5)
        
        XCTAssert(events.first?._name == "Batt. Voltage")
        
        XCTAssert(events.first?._unit == "V")
        
        XCTAssert(events.first?._measurements.count == 3)
    }
    
    func testMeasurementFactory() {
        let doubleMeasurement = MeasurementFactory.makeMeasurement(json: JSON([1519218318,13.535382312289563]))
        XCTAssert(doubleMeasurement is DoubleMeasurement)
        
        let stringMeasurement = MeasurementFactory.makeMeasurement(json: JSON([1519218316,"0B100100"]))
        XCTAssert(stringMeasurement is StringMeasurement)
        
        let locationMeasurement = MeasurementFactory.makeMeasurement(json: JSON([1519218320,[40.62648001646654,-73.1562317111913]]))
        XCTAssert(locationMeasurement is LocationMeasurement)
    }
    
}

extension NetronixTests: EnvDevEventSourceDelegate {
    func envDevEventsSourceReceived(events: [Event]) {
        envDevEventSourceWorkingExpectation?.fulfill()
        envDevEventSourceWorkingExpectation = nil
    }
}
