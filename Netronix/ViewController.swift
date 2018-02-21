//
//  ViewController.swift
//  Netronix
//
//  Created by Rott Marius Gabriel on 20/02/2018.
//  Copyright © 2018 Rott Marius Gabriel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var envDevEventSource: EnvDevEventSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
    func envDevEventsSourceReceived(events: [Event]) {
        
    }
}

//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 0
//    }
//
//    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 50
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//}

