//
//  PlaygroundBluetoothConnectionViewDelegate.swift
//  PlaygroundBluetooth
//
//  Created by Shinichiro Oba on 2017/09/22.
//  Copyright © 2017 ooba. All rights reserved.
//

import Foundation
import CoreBluetooth

public protocol PlaygroundBluetoothConnectionViewDelegate : NSObjectProtocol {
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, shouldDisplayDiscovered peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) -> Bool
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, shouldConnectTo peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?, rssi: Double) -> Bool
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, willDisconnectFrom peripheral: CBPeripheral)
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, titleFor state: PlaygroundBluetoothConnectionView.State) -> String
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, firmwareUpdateInstructionsFor peripheral: CBPeripheral) -> String
}
