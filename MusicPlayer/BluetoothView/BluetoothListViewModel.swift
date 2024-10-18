//
//  BluetoothListViewModel.swift
//  MusicPlayer
//
//  Created by Aswanth K on 18/10/24.
//

import Foundation
import CoreBluetooth

class BluetoothListViewModel: NSObject, ObservableObject {
    
    private var centralManager: CBCentralManager?
    private var periferals: [CBPeripheral] = []
    @Published var devicesNames: [String] = []
    
    override init() {
        super .init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
    
}
extension BluetoothListViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !periferals.contains(peripheral) {
            self.periferals.append(peripheral)
            self.devicesNames.append(peripheral.name ?? "Unknown device")
        }
    }
    
}
