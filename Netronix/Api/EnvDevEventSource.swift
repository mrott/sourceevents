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
    func envDevEventsSourceReceived(objects: [Any])
}

class EnvDevEventSource {
    
    fileprivate weak var delegate: EnvDevEventSourceDelegate?
    
    init(delegate: EnvDevEventSourceDelegate) {
        self.delegate = delegate
    }
    
    fileprivate var eventSource: EventSource?
    
    deinit {
        eventSource?.close()
    }
    
    func startListening() {
        
    }
}
