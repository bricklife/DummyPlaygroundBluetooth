//
//  PlaygroundBluetoothCentralManagerDelegate.swift
//  PlaygroundBluetooth
//
//  Created by Shinichiro Oba on 2017/09/22.
//  Copyright © 2017 ooba. All rights reserved.
//

import Foundation
import CoreBluetooth

public protocol PlaygroundBluetoothCentralManagerDelegate : NSObjectProtocol {
    
    func centralManagerStateDidChange(_ centralManager: PlaygroundBluetoothCentralManager)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDiscover peripheral: CBPeripheral, withAdvertisementData advertisementData: [String: Any]?, rssi: Double)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, willConnectTo peripheral: CBPeripheral)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didConnectTo peripheral: CBPeripheral)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didFailToConnectTo peripheral: CBPeripheral, error: Error?)
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDisconnectFrom peripheral: CBPeripheral, error: Error?)
}
