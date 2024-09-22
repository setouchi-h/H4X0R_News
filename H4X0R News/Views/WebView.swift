//
//  WebView.swift
//  H4X0R News
//
//  Created by 橋本一輝 on 2024/09/22.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WebView.UIViewType {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                uiView.load(URLRequest(url: url))
            }
        }
    }
}
