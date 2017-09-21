//
//  PlaygroundBluetooth.swift
//  PlaygroundBluetooth
//
//  Created by ooba on 21/09/2017.
//  Copyright © 2017 ooba. All rights reserved.
//

import Foundation
import CoreBluetooth

public class PlaygroundBluetoothCentralManager {
    
    public var delegate: PlaygroundBluetoothCentralManagerDelegate?
}

public protocol PlaygroundBluetoothCentralManagerDelegate : NSObjectProtocol {
    
    func centralManagerStateDidChange(_ centralManager: PlaygroundBluetoothCentralManager)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDiscover peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, willConnectTo peripheral: CBPeripheral)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didConnectTo peripheral: CBPeripheral)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didFailToConnectTo peripheral: CBPeripheral, error: Error?)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDisconnectFrom peripheral: CBPeripheral, error: Error?)
}

public class PlaygroundBluetoothConnectionView: UIView {
    
    public var delegate: PlaygroundBluetoothConnectionViewDelegate?
    public var dataSource: PlaygroundBluetoothConnectionViewDataSource?
    
    public enum State {
        case noConnection
        case connecting
        case searchingForPeripherals
        case selectingPeripherals
        case connectedPeripheralFirmwareOutOfDate
    }
    
    public enum FirmwareStatus {
        case upToDate
    }
    
    public struct Item {
        
        let name: String
        let icon: UIImage
        let issueIcon: UIImage
        let firmwareStatus: FirmwareStatus?
        let batteryLevel: Double?
        
        init(name: String, icon: UIImage, issueIcon: UIImage, firmwareStatus: FirmwareStatus? = nil, batteryLevel: Double? = nil) {
            self.name = name
            self.icon = icon
            self.issueIcon = issueIcon
            self.firmwareStatus = firmwareStatus
            self.batteryLevel = batteryLevel
        }
    }
}

public protocol PlaygroundBluetoothConnectionViewDelegate : NSObjectProtocol {

    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, shouldDisplayDiscovered peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) -> Bool
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, shouldConnectTo peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) -> Bool
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, willDisconnectFrom peripheral: CBPeripheral)
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, titleFor state: PlaygroundBluetoothConnectionView.State) -> String
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, firmwareUpdateInstructionsFor peripheral: CBPeripheral) -> String
}

public protocol PlaygroundBluetoothConnectionViewDataSource : NSObjectProtocol {

    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, itemForPeripheral peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?) -> PlaygroundBluetoothConnectionView.Item
}
