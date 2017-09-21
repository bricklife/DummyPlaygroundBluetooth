//
//  PlaygroundBluetoothConnectionViewDataSource.swift
//  PlaygroundBluetooth
//
//  Created by Shinichiro Oba on 2017/09/22.
//  Copyright © 2017 ooba. All rights reserved.
//

import Foundation
import CoreBluetooth

public protocol PlaygroundBluetoothConnectionViewDataSource : NSObjectProtocol {
    
    func connectionView(_ connectionView: PlaygroundBluetoothConnectionView, itemForPeripheral peripheral: CBPeripheral, withAdvertisementData advertisementData: [String : Any]?) -> PlaygroundBluetoothConnectionView.Item
}
