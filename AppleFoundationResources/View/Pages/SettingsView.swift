//
//  SettingsView.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct SettingsView: View {    
    @State private var darkMode = false
    var body: some View {
        Form {
            Section {
                HStack {
                    Toggle("Dark Mode", isOn: $darkMode)
                }
            } header: {
                Text("Appearance")
            }
        }
        .navigationTitle("Settings")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
