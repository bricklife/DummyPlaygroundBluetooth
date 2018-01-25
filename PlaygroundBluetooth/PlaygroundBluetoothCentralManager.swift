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
    
    public private(set) var connectedPeripherals: [CBPeripheral] = []

    public weak var delegate: PlaygroundBluetoothCentralManagerDelegate?
    
    public private(set) var scanning: Bool = false
    
    public private(set) var state: CBManagerState = .unknown
    
    public init(services: [CBUUID]?, queue: DispatchQueue = .main) {
        
    }
    
    public func connect(to peripheral: CBPeripheral, timeout: TimeInterval? = nil, callback: ((CBPeripheral, Error?) -> Void)? = nil) {
        
    }
    
    public func connect(toPeripheralWithUUID uuid: UUID, timeout: TimeInterval = 7, callback: ((CBPeripheral?, Error?) -> Void)? = nil) {
        
    }
    
    public func connectToLastConnectedPeripheral(timeout: TimeInterval = 7.0, callback: ((CBPeripheral?, Error?) -> Void)? = nil) -> Bool {
        return false
    }
    
    public func disconnect(from: CBPeripheral) {
        
    }
    
    public enum ConnectionError {
        case timeoutExpired
        case excessiveConnections
        case connectionFailed
        case connectionLost
        case invalidState
    }
}
