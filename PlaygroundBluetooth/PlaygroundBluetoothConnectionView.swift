//
//  PlaygroundBluetoothConnectionView.swift
//  PlaygroundBluetooth
//
//  Created by Shinichiro Oba on 2017/09/22.
//  Copyright © 2017 ooba. All rights reserved.
//

import Foundation
import CoreBluetooth

public class PlaygroundBluetoothConnectionView: UIView {
    
    public weak var delegate: PlaygroundBluetoothConnectionViewDelegate?
    
    public weak var dataSource: PlaygroundBluetoothConnectionViewDataSource?
    
    public init(centralManager: PlaygroundBluetoothCentralManager, delegate: PlaygroundBluetoothConnectionViewDelegate? = nil, dataSource: PlaygroundBluetoothConnectionViewDataSource? = nil) {
        super.init(frame: CGRect.zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50),
            widthAnchor.constraint(equalToConstant: 200),
        ])
        
        backgroundColor = .white
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setItem(_ item: Item, forPeripheral peripheral: CBPeripheral) {
        
    }
    
    public func setName(_ name: String, forPeripheral peripheral: CBPeripheral) {
        
    }
    
    public func setIcon(_ icon: UIImage, forPeripheral peripheral: CBPeripheral) {
        
    }
    
    public func setIssueIcon(_ issueIcon: UIImage, forPeripheral peripheral: CBPeripheral) {
        
    }
    
    public func setBatteryLevel(_ batteryLevel: Double?, forPeripheral peripheral: CBPeripheral) {
        
    }
    
    public func setFirmwareStatus(_ firmwareStatus: Item.FirmwareStatus?, forPeripheral peripheral: CBPeripheral) {
        
    }
    
    public struct Item {
        
        public var name: String
        public var icon: UIImage
        public var issueIcon: UIImage
        public var firmwareStatus: FirmwareStatus?
        public var batteryLevel: Double?
        
        public init(name: String, icon: UIImage, issueIcon: UIImage, firmwareStatus: FirmwareStatus? = nil, batteryLevel: Double? = nil) {
            self.name = name
            self.icon = icon
            self.issueIcon = issueIcon
            self.firmwareStatus = firmwareStatus
            self.batteryLevel = batteryLevel
        }
        
        public enum FirmwareStatus {
            case upToDate
            case outOfDate
        }
    }
    
    public enum State {
        case noConnection
        case connecting
        case searchingForPeripherals
        case selectingPeripherals
        case connectedPeripheralFirmwareOutOfDate
    }
}
