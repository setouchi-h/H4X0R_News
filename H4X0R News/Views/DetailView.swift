//
//  DetailView.swift
//  H4X0R News
//
//  Created by 橋本一輝 on 2024/09/22.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.apple.com")
}
