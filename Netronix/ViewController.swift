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
    var objects: [Any] = []
    
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
        objects.removeAll()
        for event in events {
            objects.append(event)
            for measurement in event._measurements {
                objects.append(measurement)
            }
        }
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let event = objects[indexPath.row] as? Event {
            let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier, for: indexPath)
            if let eventCell = cell as? EventTableViewCell {
                eventCell.configure(event: event)
            }
            return cell
        }
        if let measurement = objects[indexPath.row] as? LocationMeasurement {
            let cell = tableView.dequeueReusableCell(withIdentifier: LocationTableViewCell.identifier, for: indexPath)
            if let locationCell = cell as? LocationTableViewCell {
                locationCell.configure(measurement: measurement)
            }
            return cell
        }
        if let measurement = objects[indexPath.row] as? StringMeasurement {
            let cell = tableView.dequeueReusableCell(withIdentifier: StringTableViewCell.identifier, for: indexPath)
            if let stringCell = cell as? StringTableViewCell {
                stringCell.configure(measurement: measurement)
            }
            return cell
        }
        if let measurement = objects[indexPath.row] as? DoubleMeasurement {
            let cell = tableView.dequeueReusableCell(withIdentifier: DoubleTableViewCell.identifier, for: indexPath)
            if let doubleCell = cell as? DoubleTableViewCell {
                doubleCell.configure(measurement: measurement)
            }
            return cell
        }
        return UITableViewCell()
    }
}

