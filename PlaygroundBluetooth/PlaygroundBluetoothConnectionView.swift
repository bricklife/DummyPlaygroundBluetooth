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
    
    public var delegate: PlaygroundBluetoothConnectionViewDelegate?
    public var dataSource: PlaygroundBluetoothConnectionViewDataSource?
    
    public init(centralManager: PlaygroundBluetoothCentralManager) {
        super.init(frame: CGRect.zero)
        backgroundColor = .gray
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setBatteryLevel(_ batteryLevel: Double?, forPeripheral: CBPeripheral) {
    }
    
    public func setFirmwareStatus(_ firmwareStatus: Item.FirmwareStatus?, forPeripheral: CBPeripheral) {
    }
    
    public enum State {
        case noConnection
        case connecting
        case searchingForPeripherals
        case selectingPeripherals
        case connectedPeripheralFirmwareOutOfDate
    }
    
    public struct Item {
        
        public let name: String
        public let icon: UIImage
        public let issueIcon: UIImage
        public let firmwareStatus: FirmwareStatus?
        public let batteryLevel: Double?
        
        public init(name: String, icon: UIImage, issueIcon: UIImage, firmwareStatus: FirmwareStatus?, batteryLevel: Double?) {
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
}
