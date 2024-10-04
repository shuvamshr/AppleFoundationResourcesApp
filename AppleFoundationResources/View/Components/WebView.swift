//
//  WebView.swift
//  AppleFoundationResources
//
//  Created by HSIN on 4/10/2024.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    // 1
    let url: String

    
    // 2
    func makeUIView(context: Context) -> WKWebView {

        return WKWebView()
    }
    
    // 3
    func updateUIView(_ webView: WKWebView, context: Context) {

        let request = URLRequest(url: URL(string: url)!)
        webView.load(request)
    }
}
