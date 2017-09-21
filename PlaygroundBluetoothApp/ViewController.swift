//
//  ViewController.swift
//  PlaygroundBluetoothApp
//
//  Created by Shinichiro Oba on 2017/09/21.
//  Copyright © 2017 ooba. All rights reserved.
//

import UIKit
import CoreBluetooth
import PlaygroundBluetooth

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let centralManager = PlaygroundBluetoothCentralManager(services: nil, queue: .main)
        let connectionView = PlaygroundBluetoothConnectionView(centralManager: centralManager)
        connectionView.delegate = self
        connectionView.dataSource = self
        
        connectionView.frame = CGRect(x: 20, y: 40, width: 200, height: 50)
        view.addSubview(connectionView)
    }
}

extension ViewController: PlaygroundBluetoothCentralManagerDelegate {
    
    func centralManagerStateDidChange(_ centralManager: PlaygroundBluetoothCentralManager) {
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDiscover peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) {
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, willConnectTo peripheral: CBPeripheral) {
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didConnectTo peripheral: CBPeripheral) {
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didFailToConnectTo peripheral: CBPeripheral, error: Error?) {
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDisconnectFrom peripheral: CBPeripheral, error: Error?) {
    }
}

extension ViewController: PlaygroundBluetoothConnectionViewDelegate {

    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, shouldDisplayDiscovered peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) -> Bool {
        return true
    }
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, shouldConnectTo peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) -> Bool {
        return true
    }
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, willDisconnectFrom peripheral: CBPeripheral) {
    }
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, titleFor state: PlaygroundBluetoothConnectionView.State) -> String {
        return "\(state)"
    }
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, firmwareUpdateInstructionsFor peripheral: CBPeripheral) -> String {
        return #function
    }
}

extension ViewController: PlaygroundBluetoothConnectionViewDataSource {

    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, itemForPeripheral peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?) -> PlaygroundBluetoothConnectionView.Item {
        let item = PlaygroundBluetoothConnectionView.Item(name: "", icon: UIImage(), issueIcon: UIImage(), firmwareStatus: nil, batteryLevel: nil)
        return item
    }
}
