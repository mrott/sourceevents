//
//  EnvDevEventSource.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 20/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import Foundation
import IKEventSource

protocol EnvDevEventSourceDelegate: class {
    func envDevEventsSourceReceived(events: [Event])
}

class EnvDevEventSource {
    
    fileprivate weak var delegate: EnvDevEventSourceDelegate?
    
    init(delegate: EnvDevEventSourceDelegate) {
        self.delegate = delegate
    }
    
    fileprivate var eventSource: EventSource?
    
    func startListening() {
        let eventSource = EventSource(url: ApiConfiguration.url, headers: [:])
        
        eventSource.onOpen {
            
        }
        
        eventSource.onError { (error) in
            
        }
        
        eventSource.onMessage {[weak self] (id, event, data) in
            self?.updateWith(data: data)
        }
    }
    
    func stopListening() {
        eventSource?.close()
    }
    
    fileprivate func updateWith(data: String?) {
        if let data = data {
            let events = EventFactory.makeEvents(data: data)
            delegate?.envDevEventsSourceReceived(events: events)
        }
        else {
            delegate?.envDevEventsSourceReceived(events: [])
        }
    }
}
