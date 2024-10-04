//
//  AboutView.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        WebView(url: "https://www.uts.edu.au/about/faculty-engineering-and-information-technology/apple-foundation-program-uts")
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
