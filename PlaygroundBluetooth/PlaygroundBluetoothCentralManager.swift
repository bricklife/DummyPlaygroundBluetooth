//
//  PlaygroundBluetoothCentralManager.swift
//  PlaygroundBluetooth
//
//  Created by Shinichiro Oba on 21/09/2017.
//  Copyright © 2017 ooba. All rights reserved.
//

import Foundation
import CoreBluetooth

public class PlaygroundBluetoothCentralManager {
    
    public weak var delegate: PlaygroundBluetoothCentralManagerDelegate?
    public private(set) var state: CBManagerState = .unknown
    
    public init(services: [CBUUID]?, queue: DispatchQueue) {
    }
    
    public func connectToLastConnectedPeripheral() -> Bool {
        return false
    }
    
    public func disconnect(from: CBPeripheral) {
    }
}
