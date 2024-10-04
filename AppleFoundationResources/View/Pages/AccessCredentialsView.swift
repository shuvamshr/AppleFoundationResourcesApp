//
//  AccessCredentialsView.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct AccessCredentialsView: View {
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("Username")
                    Spacer()
                    Text("AFPCohort")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Password")
                    Spacer()
                    Text("WeAreDevs")
                        .foregroundStyle(.secondary)
                }
            } header: {
                 Text("WIFI Details")
            }
            Section {
                HStack {
                    Text("URL")
                    Spacer()
                    Text("bit.ly/2xfwu")
                        .foregroundStyle(.secondary)
                }
                HStack {
                    Text("Password")
                    Spacer()
                    Text("SwiftIsFun")
                        .foregroundStyle(.secondary)
                }
            } header: {
                 Text("Miro Details")
            }
        }
        .navigationTitle("Access Credentials")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AccessCredentialsView_Previews: PreviewProvider {
    static var previews: some View {
        AccessCredentialsView()
    }
}
