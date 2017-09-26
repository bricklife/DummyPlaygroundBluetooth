//: A UIKit based Playground for presenting user interface

import UIKit
import CoreBluetooth
import PlaygroundBluetooth
import PlaygroundSupport

private let serviceUuid = CBUUID(string: "180F")
private let characteristicUuid = CBUUID(string: "2A19")

class ViewController: UIViewController {
    
    private let centralManager = PlaygroundBluetoothCentralManager(services: nil, queue: .main)
    private var connectionView: PlaygroundBluetoothConnectionView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralManager.delegate = self
        
        let connectionView = PlaygroundBluetoothConnectionView(centralManager: centralManager)
        connectionView.delegate = self
        connectionView.dataSource = self
        
        view.addSubview(connectionView)
        NSLayoutConstraint.activate([
            connectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            connectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            ])
        
        self.connectionView = connectionView
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
        let name = peripheral.name ?? "Unknown"
        let icon = UIImage()
        let item = PlaygroundBluetoothConnectionView.Item(name: name, icon: icon, issueIcon: icon, firmwareStatus: nil, batteryLevel: nil)
        return item
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
        peripheral.delegate = self
        peripheral.discoverServices([serviceUuid])
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didFailToConnectTo peripheral: CBPeripheral, error: Error?) {
    }
    
    func centralManager(_ centralManager: PlaygroundBluetoothCentralManager, didDisconnectFrom peripheral: CBPeripheral, error: Error?) {
    }
}

extension ViewController: CBPeripheralDelegate {
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let service = peripheral.services?.first(where: { $0.uuid == serviceUuid }) {
            peripheral.discoverCharacteristics([characteristicUuid], for: service)
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristic = service.characteristics?.first(where: { $0.uuid == characteristicUuid }) {
            if characteristic.properties.contains(.read) {
                peripheral.readValue(for: characteristic)
            }
            if characteristic.properties.contains(.notify) {
                peripheral.setNotifyValue(true, for: characteristic)
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let value = characteristic.value?.first {
            connectionView?.setBatteryLevel(Double(value) / 100, forPeripheral: peripheral)
        }
    }

}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = ViewController()
