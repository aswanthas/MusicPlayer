//
//  BluetoothListView.swift
//  MusicPlayer
//
//  Created by Aswanth K on 18/10/24.
//

import SwiftUI

struct BluetoothListView: View {
    @ObservedObject private var viewModel = BluetoothListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.devicesNames, id: \.self) { device in
                Text(device)
            }
            .navigationTitle("Devices")
        }
    }
}

#Preview {
    BluetoothListView()
}
