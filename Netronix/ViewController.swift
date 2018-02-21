//
//  ViewController.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 20/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var envDevEventSource: EnvDevEventSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        envDevEventSource = EnvDevEventSource(delegate: self)
        envDevEventSource?.startListening()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    deinit {
        envDevEventSource?.stopListening()
    }
}

extension ViewController: EnvDevEventSourceDelegate {
    func envDevEventsSourceReceived(objects: [Any]) {
        
    }
}
